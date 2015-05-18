(define exists?
    (lambda (pred lst)
       (cond ((null? lst) #f)
             ((pred (car lst)) #t)
	     (else (exists? pred (cdr lst))))))
