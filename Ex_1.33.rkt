#lang sicp

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a) (filtered-accumulate filter combiner null-value term (next a) next b))
          (filtered-accumulate filter combiner null-value term (next a) next b))))

; Sum the squares of the prime numbers in the interval a to b

(define (square x)
  (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond
    [(> (square test-divisor) n) n]
    [(divides? test-divisor n) test-divisor]
    [else (find-divisor n (+ test-divisor 1))]))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (divides? a b)
  (= (remainder b a) 0))
(define (inc x)
  (+ x 1))
(filtered-accumulate prime? + 0 square 0 inc 2)

; the product of all the positive integers less than n that are relatively prime to n
; (i.e., all positive integers i < n such that GCD(i,n) = 1)
; I think n is just b
;
(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b))))

(define (identity x)
  x)

(define (product-relprimes n)
  (define (gcd-one? x)
    (= 1 (gcd x n)))
  (filtered-accumulate gcd-one? * 1 identity 0 inc n))

(product-relprimes 10)
