#lang racket

(define (elso n [fibs '(1 1)])
  (if (< (car fibs) n)
      (elso n (cons (+ (first fibs) (second fibs)) fibs))
      (reverse (drop fibs 1))))

(elso 15)

(let ((lst '(1 2 3 4 5 6)))
  (filter even? lst))

(foldl + 0 (filter even? (elso 4000000)))