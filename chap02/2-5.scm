(define empty-env
   (lambda () '()))
(define extend-env 
   (lambda (var val env)
      (cons (cons var val) env)))
(define apply-env
  (lambda (env var)
    (cond ((equal? (caar env) var) (cdar env))
          ((null? env) (display "error"))
	  (else (apply-env (cdr env) var)))))


