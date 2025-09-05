#lang sicp

(define (sum term a next b)
  (if (> a b) 0 (+ (term a) (sum term (next a) next b))))

(define (inc x)
  (+ x 1))

(define (cube x)
  (* x x x))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (the-f k)
    (f (+ a (* k h)))) ; This in the example is cube
  (define (f-with-multiplier k)
    (* (cond
         [(odd? k) 4]
         [(or (= k 0) (= k n)) 1]
         [(even? k) 2])
       (the-f k)))
  (* (/ h 3) (sum f-with-multiplier 0 inc n)))

(simpson cube 0 1 100.0)

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(integral cube 0 1 0.01)
(simpson cube 0 1 1000.0)
(integral cube 0 1 0.001)
