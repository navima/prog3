#lang racket


(define (völgyify l [res '()])
  (if (empty? l)
      res
      (völgyify (if (< (length l) 2) '() (drop l 2)) (if (<(length l) 2) (cons (car l) res) (append (cons (car l) res) (list (second l)))))))

(define (f lst)
  (if (even? (length lst)) (reverse (völgyify (sort lst <))) (völgyify (sort lst <))))

(define (main)
  (let loop ((line (read-line (current-input-port) 'any)))
    (unless (eof-object? line)
      (displayln (string-join (map number->string (f (map string->number (string-split line)))) " "))
      (main))))
(main)