#lang sicp

(define (cube a)
  (* a a a))

; Computes the sum of the integers from a through b
(define (sum-integers a b)
  (if (> a b)
    0
    (+ a (sum-integers (+ a 1) b))))

(sum-integers 5 10)    

; Computers the sum of the cubes of the integers in the given range
(define (sum-cubes a b)
  (if (> a b)
    0
    (+ (cube a) (sum-cubes (+ a 1) b))))

; Sum of a series of terms in the series 1/1*3 + 1/5*7...
; Slowy converges on pi/8 (for some reason)
(define (pi-sum a b)
  (if (> a b)
    0
    (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

(pi-sum 2 5)
