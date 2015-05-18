(module test-eopl (lib "eopl.ss" "eopl")
;(load "../unit-test.scm")
(define identifier? symbol?)

(define-datatype env-type env-type?
    (empty-env-type)
        (non-empty-env
	       (_var identifier?)
	              (_val number?)
		             (_env env-type?)))
(define empty-env
    (lambda ()
          (empty-env-type)))
(define extend-env
    (lambda (var val stack)
          (non-empty-env var val stack)))
(define x (extend-env 'b 2 (extend-env 'a 1 (empty-env))))
(define apply-env
    (lambda (var env)
             (cases env-type env
	                (empty-env-type () (eopl:error "No such variable"))
			           (non-empty-env (_var _val _env) (if (equal? _var var) _val (apply-env var _env))))))

(display (apply-env 'a x))
(display (apply-env 'b x))

)
