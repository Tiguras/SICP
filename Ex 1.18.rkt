#lang sicp


(define (multi-iter x y)
  (f x y 0))

(define (f x y a)
  (cond ((= y 1)(+ x a))
        ((even? y)(f (double x)(halve y) a))
        (else (f x (- y 1) (+ a x)))))

(define (double x)
  (* x 2))
(define (halve x)
  (/ x 2))

(f 2 52 0)