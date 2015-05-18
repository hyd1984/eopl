(load-relative "environments.scm")
(define the-lexical-spec
  '((whitespace (whitespace) skip)
    (comment ("%" (arbno (not #\newline))) skip)
    (identifier
     (letter (arbno (or letter digit "_" "-" "?")))
     symbol)
    (number (digit (arbno digit)) number)
    (number ("-" digit (arbno digit)) number)
    ))
(define init-env 
    (lambda ()
      (extend-env 
       'i (num-val 1)
       (extend-env
        'v (num-val 5)
        (extend-env
         'x (num-val 10)
         (empty-env))))))

;;;;;;;;;;;;;;;; environment constructors and observers ;;;;;;;;;;;;;;;;

  (define empty-env
    (lambda ()
      (empty-env-record)))
  
  (define empty-env? 
    (lambda (x)
      (empty-env-record? x)))

  (define extend-env
    (lambda (sym val old-env)
      (extended-env-record sym val old-env)))

  (define apply-env
    (lambda (env search-sym)
      (if (empty-env? env)
	(eopl:error 'apply-env "No binding for ~s" search-sym)
	(let ((sym (extended-env-record->sym env))
	      (val (extended-env-record->val env))
	      (old-env (extended-env-record->old-env env)))
	  (if (eqv? search-sym sym)
	    val
	    (apply-env old-env search-sym))))))


  (define the-grammar
      '((program (expression) a-program)
            (expression (number) const-exp)
	    (expression ("minus" "(" expression ")") minus-exp)
	    (expression ("-" "(" expression "," expression ")") diff-exp)
	    (expression ("zero?"   ")") zero?-exp)
	    (expression ("if" expression "then" expression "else" expression) if-exp)
            (expression (identifier) var-exp)
	    (expression ("let" identifier "=" expression "in" expression) let-exp)))

(sllgen:make-define-datatypes the-lexical-spec the-grammar)

(define scan&parse
  (sllgen:make-string-parser the-lexical-spec the-grammar))


(define-datatype expression expression?
  (const-exp
      (num number?))
  (diff-exp
      (exp1 expression?)
      (exp2 expression?))
  (zero?-exp
      (exp1 expresison?))
  (if-exp
      (exp1 expression?)
      (exp2 expression?)
      (exp3 expression?))
  (minus-exp 
      (exp1 expression?))
  (var-exp
     (var identifier?))
  (let-exp
     (var identifier?)
     (exp1 expression?)
     (body expression?)))
(define value-of
    (lambda (exp env)
          (cases expression exp
	  (const-exp (num) (num-val num))
          (var-exp (var) (apply-env env var))
	  (diff-exp (exp1 exp2)
	     (let ((val1 (value-of exp1 env))
		   (val2 (value-of exp2 env)))
	       (let ((num1 (expval->num val1))
	             (num2 (expval->num val2)))
	            (num-val (- num1 num2)))))
	 (minus-exp (exp1)
	   (let ((val1 (value-of exp1 env)))
	       (let ((num (expval->num val1)))
	             (num-val (- num)))))
	  (zero?-exp (exp1)
		(let ((val1 (value-of exp1 env)))
		(let ((num1 (expval->num val1)))
		 (if (zero? num1)
		     (bool-val #t)
		     (bool-val #f)))))
	         (if-exp (exp1 exp2 exp3)
	           (let ((val1 (value-of exp1 env)))
	            (if (expval->bool val1)
	              (value-of exp2 env)
	              (value-of exp3 env))))
	             (let-exp (var exp1 body)       
	                (let ((val1 (value-of exp1 env)))
	            (value-of body
	              (extend-env var val1 env))))
		          )))

(sllgen:make-define-datatypes the-lexical-spec the-grammar)

(define scan&parse
  (sllgen:make-string-parser the-lexical-spec the-grammar))


(define value-of-program
  (lambda (pgm)
    (cases program pgm
	   (a-program (exp1)
		      (value-of exp1 (init-env))))))
 (define run-exer 
        (lambda (string)
              (value-of-program (scan&parse string))))

