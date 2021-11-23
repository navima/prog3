#lang racket

(define (asd a)
  (if (> a 0)
    (- a)
    a
  )
)

(define (main)
  (let ((a (read))) 
    (unless (eof-object? a)
      (printf "~a: ~a\n" a (asd a))
      (main)
    )
  )
)

(main)