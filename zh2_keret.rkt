#lang racket

(define (oldal n x y [res '()])
  (cond
   [(> y (/ n 2)) (reverse (take res (ceiling (/ (length res) 2))))]
   [(= (* x y) n) (oldal n (+ x 1) y (cons (list 4 (+ x y x y -8) (- n (+ x y x y -8) 4)) res))]
   [(< (* x y) n) (oldal n (+ x 1) y res)]
   [(> (* x y) n) (oldal n 2 (+ y 1) res)]))
      
(define (f n)
  (oldal n 2 2))
(define (main)
  (let helper ((case-nr 1))
    (let ((line (read-line (current-input-port) 'any)))
      (unless (eof-object? line)
        (when (< 1 case-nr)
          (displayln ""))
        (printf "Case #~a:~n" case-nr)
        (for-each (λ (lst)
                    (printf "~a ~a ~a~n" (first lst) (second lst) (third lst)))
                  (f (string->number line)))
        (helper (add1 case-nr))))))

(main)