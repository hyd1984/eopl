(load "../unit-test.scm")
(load "2-12.scm")
(display "2-12")
(define emp (empty-stack))
(define stack (push (push (push emp 1) 2) 3))
(assert-right (top stack) 3)
(define stack1 (pop stack))
(assert-right (top stack1) 2)

