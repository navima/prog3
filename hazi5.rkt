#lang racket

(define (makeNegative x)
  (if (> x 0)
    (- 0 x)
    x
  )
)

(define (asd lst index)
  (if (= index (length lst))
      lst
      (asd (list-update lst index (lambda (x) (number->string (makeNegative (string->number x))))) (+ index 1))))

(define (main)
  (let ((a (read-line)))
    (unless (eof-object? a)
      (displayln (string-join (map number->string (map makeNegative (map string->number (string-split a)))) " "))
      (displayln (string-join (asd (string-split a) 0)" "))
      (main)
    )
  )
)

(main)