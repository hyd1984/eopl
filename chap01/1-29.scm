(load "1-28.scm")
(load "half.scm")
(define sort
    (lambda (lst)
       (cond ((= (length lst) 1) lst)
             ((= (length lst) 2) (merge (prev-half lst) (post-half lst)))
	     (else (merge (sort (prev-half lst)) (sort (post-half lst)))))))
