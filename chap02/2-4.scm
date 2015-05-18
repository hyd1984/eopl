(define empty-stack '())
(define push
   (lambda (item stack)
      (cons item stack)))

(define pop
   (lambda (stack)
      (cdr stack)))

(define top
   (lambda (stack)
      (car stack)))
(define empty-stack?
   (lambda (stack)
      (null? stack)))
