#lang sicp

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f (x)) (f (+ x dx))) 3)))

(define (square x)
  (* x x))

; ((smooth square) 1)


(/ (+ (square (- 1 dx)) (square (1)) (square (+ 1 dx))) 3)
