#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))
(define (square x)
  (* x x))
(define (inc x)
  (+ x 1))

(define (repeated f n)
  (define (recur i)
    (if (= i n) f
      (compose f (recur (inc i)))))
  (recur 1))


((repeated square 3) 2)


; chatGPT corrects repeated as 
(define (repeated-gpt f n)
  (if (= n 0)
    (lambda (x) x) ; If n is 0, return the identity function.
    (compose f (repeated-gpt f (- n 1))))) ; Otherwise, compose f with the result of repeated f, n-1 times.

((repeated-gpt square 3) 2)
