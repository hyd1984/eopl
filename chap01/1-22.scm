(define filter-in
   (lambda (fn lst)
      (cond ((null? lst) '())
            ((fn  (car lst)) (cons (car lst) (filter-in fn (cdr lst))))
	    (else (filter-in fn (cdr lst))))))
