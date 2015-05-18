(define replace
   (lambda (a b elem)
      (cond 
         ((equal? b elem) a)
	 ((equal? a elem) b)
	 (else elem))))

(define swapper
   (lambda (a b lst)
      (cond
         ((null? lst) '())
	 ((pair? (car lst)) (cons (swapper a b (car lst)) (swapper a b (cdr lst))))
	 (else (cons (replace a b (car lst)) (swapper a b (cdr lst)))))))
