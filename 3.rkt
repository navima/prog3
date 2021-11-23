#lang racket
(require racket/trace)

;explicit lista
'(1 2 3 4)

;knuth listadefiníció (x:xs) szerinti szummázás
(apply + '(1 2 3 4))
(define (my-sum lst)
    (if (empty? lst)
        0
        (+ (car lst) (my-sum (cdr lst)))))
(my-sum '(1 2 3 4))



(define A '(1 2 3 4))

(empty? A)
(null? A)
(car A)
(cdr A)
(first A)
(rest A)
(second A)
(third A)
;(tenth A)

;üres lista csinálása
'()
null
empty
(list)
(list 1 5 3 (list 5 1) 11)

(trace my-sum)
(my-sum '(15 61 0 60 51 1))
(untrace my-sum)