(define (reportmsg msg)
	(display msg)
        (newline))

(define (reporterr msg)
     (display "ERROR: ")
     (display msg)
     (newline))
(define (assert wrong-msg right-msg  b)
  ( if ( not b) (reporterr wrong-msg) (reportmsg right-msg)))

(define (assert-right  a b)
    (assert " Wrong!!" "Right!" (equal? a b)))

(define (assert-num-right  a b)
    (assert " Wrong!!" "Right!" (= a b)))
