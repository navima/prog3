#lang racket


(define (g s [res 0])
  (if (empty? s)
      res
      (if (or (< (char->integer (car s)) (char->integer #\a)) (> (char->integer (car s)) (char->integer #\m)))
          (g (cdr s) (+ res 1))
          (g (cdr s) res))))
           
(define (f s)
  (printf "~a/~a\n" (g s) (length s)))
(define (main)
  (let loop ((line (read-line (current-input-port) 'any)))
    (unless (eof-object? line)
      (f (string->list line))
      (main))))
(main)