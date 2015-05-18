(define empty-stack
  (lambda ()
   (lambda (cmd)
      (cond ((equal? cmd 'pop) (error "Cannot pop"))
            ((equal? cmd 'top) (error "Cannot top"))
	    (else (error "No such command"))))))

(define push
   (lambda (stack val)
      (lambda (cmd)
          (cond ((equal? 'pop cmd) stack)
	        ((equal? 'top cmd) val)
		(else (error "No such command"))))))

(define pop
   (lambda (stack)
      (stack 'pop)))

(define top
   (lambda (stack)
     (stack 'top)))
