#lang sicp

(define (square x)
  (* x x))
((lambda (x y z) (+ x y ((lambda (x) (* x x)) z))) 1 2 3)

(define (f x y)
  ((lambda (a b) (+ (* x (square a)) (* y b) (* a b))) (+ 1 (* x y)) (- 1 y)))

(define (let-f x)
  (let ([x 3] [y (+ x 2)]) (* x y)))

(define (test x)
  (+ (let ([x 3]) (+ x (* x 10))) x))
(test 2)
