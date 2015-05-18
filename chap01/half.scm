
(define splice-list
   (lambda (lst cnt)
      (if (= cnt 0)
          '()
	  (cons (car lst) (splice-list (cdr lst) (- cnt 1))))))
(define prev-half
     (lambda (lst)
        (splice-list lst (quotient (length lst) 2))))
(define  post-half
    (lambda (lst)
       (reverse (splice-list (reverse lst) (- (length lst) (quotient (length lst) 2))))))
