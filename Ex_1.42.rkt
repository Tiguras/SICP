#lang sicp

(define (inc x)
  (+ x 1))
(define (square x)
  (* x x))

; x => f(g(x))
(define (compose f g)
  (lambda (i) (f (g i))))

((compose square inc) 6)
