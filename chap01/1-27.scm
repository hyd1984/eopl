(define flatten
    (lambda (lst)
        (cond ((null? lst) '())
	      ((null? (car lst)) (flatten (cdr lst)))
	      ((symbol? (car lst)) (cons (car lst) (flatten (cdr lst))))
	      ((pair? (car lst)) (append  (flatten (car lst)) (flatten (cdr lst)))))))
