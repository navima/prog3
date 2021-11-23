#lang racket

(define (calc-bee n [H 0] [N 0] [M 1])
  (if (= n 0)
      (printf "~a ~a~n" H (+ N H M))
      (calc-bee (- n 1) (+ N H M) H M)))

(define (main)
  (let ((n (string->number (read-line))))
    (unless (= -1 n)
      (calc-bee n)
      (main)
    )
  )
)

(main)