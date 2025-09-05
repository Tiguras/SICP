#lang sicp

(define (inc x)
  (+ x 1))

;(define (product term a next b)
;  (if (> a b) 1
;    (* (term a) (product term (next a) next b))))
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
    (iter a 1))

(define (first k)
  (cond ((= k 0) 2)
	((even? k) (+ 2 k))
	((odd? k) (+ k 3))))

(define (second j)
  (if (even? j) (+ j 3)
    (+ j 2)))

(* 4.0 (/ (product first 0 inc 100) (product second 0 inc 100)))
  

