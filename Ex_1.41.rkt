#lang sicp

(define (double x)
  (lambda (i) (x(x i))))

(define (inc x)
  (+ x 1))

(((double (double double)) inc) 5)
