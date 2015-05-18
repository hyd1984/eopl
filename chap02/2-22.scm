(module test-eopl (lib "eopl.ss" "eopl")
;(load "../unit-test.scm")
(define identifier? symbol?)
(define-datatype stack-type stack-type?
      (empty-stack-type)
      (non-empty-stack
           (_val number?)
	   (_stack stack-type?)))
(define  empty-stack
   (lambda ()
     (empty-stack-type)))

(define push
    (lambda (val stack)
        (non-empty-stack val stack)))
(define pop
   (lambda (stack)
      (cases stack-type stack
         (empty-stack-type () (eopl:error "Cannot pop empty stack"))
	 (non-empty-stack (_val _stack) _stack))))

(define top
    (lambda (stack)
      (cases stack-type stack
         (empty-stack-type () (eopl:error "Cannot the top of empty stack"))
	 (non-empty-stack (_val _stack) _val))))

(define stack (push 2 (push 1 (empty-stack))))
(display (top stack))
(newline)
(define s1 (pop stack))
(display (top s1))
)
