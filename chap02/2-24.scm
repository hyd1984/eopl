(module test-eopl (lib "eopl.ss" "eopl")
;(load "../unit-test.scm")
(define identifier? symbol?)


(define-datatype bintree bintree?
    (leaf-node
        (num integer?))
	(interior-node
	    (key symbol?)
	    (left bintree?)
	    (right bintree?)))

(define bintree-to-list
   (lambda (btree)
       (cases bintree btree
          (interior-node (key left right) (list 'interior key (bintree-to-list left) (bintree-to-list right)))
	  (leaf-node (num) (list 'leaf-node num)))))

(display (bintree-to-list (interior-node 'a (leaf-node 3) (leaf-node 4))))
)
