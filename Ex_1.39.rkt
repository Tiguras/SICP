#lang sicp

(define (cont-frac n d k)
  (define (x i)
    (if (= i k)
        (/ (n i) (d i)) ; Base case
        (/ (n i) (- (d i) (x (inc i))))))
  (x 1))

(define (inc x)
  (+ x 1))

(define (tan-cf x)
  (cont-frac 
    (lambda (i) (if (= i 1) x (* x x))) 
    (lambda (i) (- (* i 2) 1)) 150))

(tan-cf 100.0)
