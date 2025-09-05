#lang sicp

(define dx 0.00001)
(define tolerance 0.000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ([next (f guess)]) (if (close-enough? guess next) next (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (compose f g)
  (lambda (i) (f (g i))))

(define (repeated f n)
  (if (= n 0)
    (lambda (x) x) ; If n is 0, return the identity function.
    (compose f (repeated f (- n 1))))) ; Otherwise, compose f with the result of repeated f, n-1 times.

; Might need to use this
(define (expt b n)
  (if (= n 0)
    1
    (* b (expt b (- n 1)))))

(define (expt-t b n)
  (if (= n 0)
      (lambda (x) 1)
      (lambda (x) (* (b x) ((expt-t b (- n 1)) x)))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y)))) 1.0))

(cube-root 8)

;(define (fourth-root x)
;  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y))))) 1.0))


(define (fifth-root x)
  (fixed-point (average-damp (average-damp (average-damp (lambda (y) (/ x (* y y y y)))))) 1.0))

(fifth-root 32)

(define (nth-root x n)
  (fixed-point 
    ((repeated average-damp (floor (log n 2)))
     (lambda (y) (/ x (expt y (- n 1))))) 1.0))
(nth-root 8 3)



