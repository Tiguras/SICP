#lang sicp

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define tolerance 0.00001)
(define (average x y)
  (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ([next (f guess)]) (if (close-enough? guess next) next (try next))))
  (try first-guess))

;(fixed-point cos 1.0)

; (fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)

; This will not converge
; (fixed-point (lambda (y) (/ x y)) 1.0))

; (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
 (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)

; (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)
