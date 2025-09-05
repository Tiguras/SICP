#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))
(define (square x)
  (* x x))
(define (inc x)
  (+ x 1))

(define (repeated f n)
  (if (= n 0)
    (lambda (x) x) ; If n is 0, return the identity function.
    (compose f (repeated f (- n 1))))) ; Otherwise, compose f with the result of repeated f, n-1 times.
