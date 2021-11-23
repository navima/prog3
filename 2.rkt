#lang racket

;(+ 3 5) ;comment

(remainder 17 5)
(remainder 17 -5)
(remainder -17 5)
(remainder -17 -5)
; A standard nyelvekben a % = remainder

(define x 51)
(define y (+ 5 5))
(define z abs)
(define (fibo n)
    (if (<= n 1)
        n 
        (+ (fibo (- n 1)) (fibo (- n 2)))))
