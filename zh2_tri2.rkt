#lang racket

#|
(define (divisors n)
  (length (filter (compose (curry = 0) (curry remainder n)) (build-list n add1))))
|#

(define (divisors n)
  (let helper ((i 1) (res 0))
    (cond
      [(> (* i i) n) res]
      [(= (* i i) n) (add1 res)]
      [(= 0 (remainder n i)) (helper (add1 i) (+ res 2))]
      [else (helper (add1 i) res)])))

(define (nth-triang n)
  (/ (* n (- n 1)) 2))

(define (search-num divisorsCount [n 1])
  (cond
    [(> (divisors (nth-triang (add1 n))) divisorsCount) (nth-triang (add1 n))]
    [(<= (divisors (nth-triang (add1 n))) divisorsCount ) (search-num divisorsCount (add1 n))]))

(define (main)
  (let ((asd (string->number (read-line))))
    (cond
      [(equal? asd 0) (display 1)]
      [(equal? asd 1) (display 3)]
      [else (display (search-num asd))])
    (display "\n")
    (main)))

(main)