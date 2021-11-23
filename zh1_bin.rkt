#lang racket

(define (bin n [l '()])
  (if (= n 0)
      (if (empty? l) '(0) l)
      (if (= (modulo n 2) 0)
          (bin (/ n 2) (cons 0 l))
          (bin (/ (- n 1) 2) (cons 1 l)))))


(define (main)
  (let ((s (read-line)))
    (unless (eof-object? s)
      (displayln (string-join (map number->string (bin (string->number s))) ""))
      (main)
    )
  )
)

(main)