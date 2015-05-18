(define list-set
   (lambda (lst idx elem)
       (if (= idx 0)
           (cons elem (cdr lst))
           (cons (car lst) (list-set (cdr lst) (- idx 1) elem)))))
