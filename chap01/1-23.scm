(define list-index
   (lambda (pred lst)
      (list-index-aux pred lst 0)))
(define list-index-aux
   (lambda (pred lst idx)
     (cond ((null? lst) #f)
           ((pred (car lst)) idx)
	   (else (list-index-aux pred (cdr lst) (+ idx 1))))))
