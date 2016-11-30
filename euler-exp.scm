(define (cont-frac n d k)
  (define (cont-frac-iter n d i)
	  (if (= (- k i) 1)
	      (/ (n i) (d i))
	      (/ (n i) (+ (d i) (cont-frac-iter n d (+ i 1))))))
  (cont-frac-iter n d 0))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           2)

(define (euler k)
(+ (cont-frac (lambda (i) 1.0)
              (lambda (i)
		         (if (= (remainder i 3) 2)
		             (/ (+ i 1) 1.5)
		              1)
		      )
              k) 2.0))