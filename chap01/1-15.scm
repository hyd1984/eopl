(load "../unit-test.scm")
(define duple
   (lambda (n elem)
      (if (= n 0)
           '()
	   (cons elem (duple (- n 1) elem)))))
