(define construct-list
  (lambda (elem lst)
      (map (lambda (e) (list elem e)) lst)))
(define product
  (lambda (lst1 lst2)
    (if (null? lst1) 
        '()
	(append (construct-list (car lst1) lst2) (product (cdr lst1) lst2)))))
