(define path-aux
   (lambda (n bst path)
        (cond ((null? (car bst)) '())
	      ((> n (car bst)) (path-aux n (caddr bst) (cons 'right path)))
	      ((< n (car bst)) (path-aux n (cadr bst) (cons 'left path)))
	      ((= n (car bst)) (reverse path)))))
(define path
   (lambda (n bst)
       (path-aux n bst '())))
