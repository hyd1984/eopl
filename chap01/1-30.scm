(load "half.scm")
(define merge-cmp
   (lambda (cmp lst1 lst2)
      (cond ((and (null? lst1) (null? lst2)) '())
            ((null? lst1)  lst2)
	    ((null? lst2) lst1)
	    ((cmp (car lst1) (car lst2))
	     (cons (car lst1) (merge-cmp cmp (cdr lst1) lst2)))
	     (else (cons (car lst2) (merge-cmp cmp lst1 (cdr lst2)))))))
(define sort/predicate
    (lambda (cmp lst)
       (cond ((= (length lst) 1) lst)
             ((= (length lst) 2) (merge-cmp cmp (prev-half lst) (post-half lst)))
	     (else (merge-cmp cmp (sort/predicate cmp (prev-half lst)) (sort/predicate cmp (post-half lst)))))))
