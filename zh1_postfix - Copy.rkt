#lang racket

(define (reduce l [processed '()])
  (if (= (length l) 0)
      processed ;return if singular
      (cond
        [(equal? (car l) "+") (reduce (append (reverse (cons (number->string (apply + (map string->number (reverse (take processed 2))))) (drop processed 2))) (cdr l)))]
        [(equal? (car l) "-") (reduce (append (reverse (cons (number->string (apply - (map string->number (reverse (take processed 2))))) (drop processed 2))) (cdr l)))]
        [else (reduce (cdr l) (cons (car l) processed))])))
  

(define (main)
  (let ((s (read-line)))
    (unless (eof-object? s)
      (let ((l (string-split s)))
        (displayln (car (reduce l)))
        (main)
      )
    )
  )
)

(main)