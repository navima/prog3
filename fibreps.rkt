#lang racket

(require racket/trace)

(define (fibreps n [l '(0)])
  (cond
      [(= n 0) (car l)]
      [(= n -1) (second l)]
      [else (if (odd? (car l))
          (fibreps (- n 1) (cons (* (car l) 2) l))
          (fibreps (- n 2) (cons (+ (* (car l) 2) 1) (cons (* (car l) 2) l))))]))
          

(define (main)
  (let ((s (read-line)))
    (unless (eof-object? s)
      (let ((n (string->number s)))
        (displayln (fibreps n))
        (main)
      )
    )
  )
)

(trace fibreps)
(main)