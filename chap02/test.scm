(load "../unit-test.scm")
(load "2-5.scm")
(display "2-5")
(define env (extend-env 'a 1
         (extend-env 'b 2
	     (extend-env 'c 3 (empty-env)))))
(assert-right (apply-env env 'a) 1)
(assert-right (apply-env env 'b) 2)
