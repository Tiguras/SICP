#lang sicp

(define (it-expt b n)
  (func b n 1))

(define (func b n a)
 
  (cond ((= n 0) 1)
        ((= n 1) (* b a))
        ((even? n) (func (square b)(/ n 2) a))
        (else (func b (- n 1)(* a b)))))

(define (square x)
  (* x x))

(it-expt 526 255)