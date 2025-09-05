#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor )))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x)
  (* x x))


(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test x y)
  (newline)
  (display x)
  (display " to ")
  (display y) (newline)
  (start-prime-test x y 0 (runtime)))

(define (start-prime-test x y count start-time)
  (if (search-for-primes x y count)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes x y count)
  (cond  ((> x y))
         ((> count 2))
         ((prime? x)
         (display x)
         (newline)
         (search-for-primes (+ x 2) y (+ count 1)))
        ((divides? 2 x) (search-for-primes (+ x 1) y count))
        (else (search-for-primes (+ x 2) y count))))

; Define a procedure next, that returns 3 if input is 2
; otherwise returns input + 2

(define (next x)
  (if (= x 2) 3
      (+ x 2)))

(timed-prime-test 1000000 888888888888)