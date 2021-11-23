#lang racket

(define (szerkeszthető a b c)
  (if (and (> (+ a b) c) (> (+ a c) b) (> (+ b c) a))
      "possible"
      "impossible"
  )
)
  

(define (main)
  (let ((line1 (read)) (line2 (read)) (line3 (read))) 
    (unless (or (eof-object? line1) (eof-object? line2) (eof-object? line3))
      (let ((a line1) (b line2) (c line3))
        (printf "~a ~a ~a: ~a\n" a b c (szerkeszthető a b c)))
      (main)
    )
  )
)

(main)