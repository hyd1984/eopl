(define invert-aux 
   (lambda (elem)
      (list (cadr elem) (car elem))))
(define invert 
   (lambda (lst)
      (if (equal? lst '())
          '()
	  (cons (invert-aux (car lst)) (invert (cdr lst))))))

