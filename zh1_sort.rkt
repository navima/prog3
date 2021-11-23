#lang racket

(define (f lst)
  (sort lst < #:key (lambda (x) ())))

(define (read-until-eof [lines '()])
  (let ((a (read-line)))
    (if (eof-object? a)
      (reverse lines)  
      (read-until-eof (cons a lines))
    )
  )
)

(define (main)
  (let ((lst (read-until-eof)))
    (displayln lst)
    (displayln (f lst))
    )
  )

        
(main)