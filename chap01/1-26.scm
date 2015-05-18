(define up
   (lambda (lst)
      (cond ((null? lst) '())
            ((pair? (car lst)) (append (car lst) (up (cdr lst))))
	    (else (cons (car lst) (up (cdr lst)))))))
