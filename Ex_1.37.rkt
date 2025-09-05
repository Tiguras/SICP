#lang sicp

; Written in a recursive manner
(define (cont-frac n d k)
  (define (x i)
    (if (= i k)
        (/ (n i) (d i)) ; Base case
        (/ (n i) (+ (d i) (x (inc i))))))
  (x 1))

(define (inc x)
  (+ x 1))

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 1)

(define (cont-frac-iter n d k)
  (define (x i total)
    (if (= i k) 
      total 
      (x (inc i) (/ (n i) [+ (d (inc i)) total]))))
   (x 1 (/ (n 0) (d 0))))

(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 1)

(cont-frac (lambda (i) 1.0) (lambda (i) 
			       (if (= (modulo (- i 2) 3) 0)
				 (- i (/ (- i 2) 3))
				 1)) 
	  100)
(define (tan-cf x)
(cont-frac (lambda (i)
	     (if (= i 1)
	       x
	       (- (* x x))))
	   (lambda (i) (- (* i 2) 1))
	   100))
(tan-cf 50)

