#lang racket

(define (divisors num [lst '()] [currNum 1])
    (cond
      [(equal? currNum (integer-sqrt num))  (if (equal? (modulo num currNum) 0)(+ (* (length lst) 2) 2) (+ (* (length lst) 2) 1))]
      [(equal? (modulo num currNum) 0) (divisors num (cons num lst) (+ currNum 1))]
      [(not (equal? (modulo num currNum) 0)) (divisors num lst (+ currNum 1))]
      ))

(define (nth-triang n)
  (/ (* n (- n 1)) 2)
  )


(define (search-num divisorsCount [n 1])
  (cond
    [(> (divisors (nth-triang (add1 n))) divisorsCount) (nth-triang (add1 n))]
    [(<= (divisors (nth-triang (add1 n))) divisorsCount ) (search-num divisorsCount (add1 n)) ]
    )
  )


(define (main)
  (let ((asd (read-line)))
    (unless (eof-object? asd)
    (cond
      [(equal? (string->number asd) 0) (display 1)]
      [(equal? (string->number asd) 1) (display 3)]
      [(equal? 0 0) (display (search-num (string->number asd)))]
      )
    (display "\n")
    (main))
 )
)

(main)