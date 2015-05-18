(define merge
   (lambda (lst1 lst2)
      (cond ((and (null? lst1) (null? lst2)) '())
            ((null? lst1)  lst2)
	    ((null? lst2) lst1)
	    ((< (car lst1) (car lst2))
	     (cons (car lst1) (merge (cdr lst1) lst2)))
	     (else (cons (car lst2) (merge lst1 (cdr lst2)))))))
