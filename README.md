## 1.5

**What behavior will Ben observe with an interpreter that uses applicative-order evaluation?** 

With an interpreter that uses applicative-order evaluation, evaluation of `(test 0 (p))` will enter an infinite recursion.
The reason is that applicative-order evaluation first evaluates the arguments and then applies the combination on these arguments. 
For `(test 0 (p))` argument `p` will be evaluated first. Because `p` expands to itself (`(define (p) (p))`), evaluation will never terminate. 

**What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer.**

With an interpreter that uses normal-order evaluation the result will be `0`. 
Normal-order evaluation model never evaluates operands until their values is needed.
Instead it will first substitute operand expressions for parameters until it obtained an expression involving only primitive operators
and will then perform the evaluation.
Therefore

`(test 0 (p))`

 will expand first to:
```
 (if (= 0 0)
       0
      (p)))
```

      
For `if` special form, predicate `(= 0 0)` is evaluated first. Therefore we get:
 ```
  (if true
        0
       (p)))
  ```
       
The consequent expression which equals to `0` of `if` special form is returned.


## 1.6

**What happens when Alyssa attempts to use this to compute square roots? Explain.**

Interpreter will return _Aborting!: maximum recursion depth exceeded._
Scheme interpreter uses applicative-order evaluation, so in case of

```
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
```
			 
it will first evaluate `new-if` arguments before applying the operation. `new-if` third argument is a reference to the same `sqrt-iter` that is evaluated at the moment, 
therefore we are entering an infinite recursion.
Infinite recursion does not happen when `if` is used because `if` is a special form and either consequent or the alternative argument is evaluated, never both.

## 1.10

**What are the values of the following expressions?**

(A 1 10) = 1024

(A 2 4) =  65536

(A 3 3) = 65536


**Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n.**

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

```
f(n) = 2n
g(n) = 2^n
h(n) = 2^2^2 ...(n-1 times)
```

## 1.34

**What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.**

Interpreter returns "The object 2 is not applicable."
The reason is that `(f f)` via

```
(define (f g)
  (g 2))
```

 expands to
 `(f 2)`
  
 which in turn expands to `(2 2)`. You cannot apply a primitive.

## 1.38
[Euler's expansion](euler-exp.scm)

## 1.41
[Procedure double](double.scm)

`(((double (double double)) inc) 5)` will return 21.

## 1.42 
[x -> f(g(x))](compose.scm)

## 1.43
[nth repeated application of f](repeated.scm)

## Functional set
[Functional set](FunctionalSet.hs)


