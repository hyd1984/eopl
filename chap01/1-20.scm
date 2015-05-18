(define count-occurences
   (lambda (elem lst)
       (count-occurences-aux elem lst 0)))
(define count 
  (lambda (elem elem1 n)
     (if (equal? elem elem1) (+ n 1) 0)))
(define count-occurences-aux
   (lambda (elem lst n)
            (cond
	       ((null? lst) n)
	       ((pair? (car lst)) (+ (count-occurences-aux elem (car lst) n) (count-occurences-aux elem (cdr lst) n) ))
	       (else (+ (count elem (car lst) n) (count-occurences-aux elem (cdr lst) n))))))
