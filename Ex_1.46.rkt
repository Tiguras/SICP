#lang sicp

; Procedure called iterative-improve that takes two procedures as arguments
; One a method for telling whether a guess is good enough
; And one for improving a guess
; iterative-improve should return a procedure that takes a guess as argument and keeps improving the guess until it is good enough
; Rewrite the sqrt procedure of 1.1.7

; The good-enough/close-enough just return a true or false
; The improve method returns the next value

(define (sqrt-iter guess x)
  (if (good-enough? guess x) 
    guess 
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0000001))

(define (square x)
  (* x x))

;(sqrt-iter 1.0 9)


; and the fixed-point procedure of section 1.3.3 in terms of iterative-improve

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	next
	(try next))))
  (try first-guess))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (iterative-improve good-enough?-p improve-p)
  (lambda (guess)
    (define (iter guess)
      (if (good-enough?-p guess)
          guess
          (iter (improve-p guess))))
    (iter guess)))
; As can be seen here, these procedures only take one argument 

(define (sqrt x)
  ; remember this will return a procedure
  ((iterative-improve (lambda (guess) (good-enough? guess x))
		     (lambda (guess) (improve guess x))) 
   ;the guess
   1.0))

(sqrt 9)


