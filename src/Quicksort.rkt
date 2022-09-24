#lang racket
;------------------------------------------------------------
; Quicksort
;------------------------------------------------------------
;---------------------------------------------------
; FUNCTION THAT CALCULATES THE AVERAGE OF A LIST
;---------------------------------------------------
(define (average lst)
  (/ (sumList lst) (lengthList lst)) )

;---------------------------------------------------
; FUNCTION THAT CALCULATES THE SUM OF A LIST
;---------------------------------------------------
(define (sumList lst)
  (if (null? lst)
      ; Checks for empty list, must be set to 0
      0
      ;--------------------------------
      ; Sum is the first element + the
      ; rest of the elements added
      ;--------------------------------
      (+ (car lst) (sumList (cdr lst))) ))

;---------------------------------------------------
; FUNCTION THAT CALCULATES THE LENGTH OF A LIST
;---------------------------------------------------
(define (lengthList lst)
  (if (null? lst)
      ; Checks for empty list, must be set to 0
      0
      ;---------------------------------------
      ; Length is one more than the list with
      ; the first element omitted
      ;---------------------------------------
      (+ 1 (lengthList (cdr lst))) ))

;----------------------------------------------------------
; myQuicksort FUNCTION DEFINITION
; Brings both smaller and larger half of the list together
; Appends the results in ascending order
;----------------------------------------------------------
(define (myQuicksort lst)
  (if (or (null? lst) (null? (cdr lst)))
      ; Returns the list if empty, must be set to return lst at end
      lst
      ; smallerHalf & largerHalf lists are brought together and appended
      (append (myQuicksort (smallerHalf lst (average lst)))
              (myQuicksort (largerHalf lst (average lst)))
              (myQuicksort (equalTo lst (average lst)))
              )))

;--------------------------------------------------------------------       
; largerHalf FUNCTION DEFINITION
; The larger half of the list, whatever is greater than the average
; Parameters include lst and averageList
; Average of the larger half will need to be calculated within
; APPEND NEEDS TO BE ADDED TO THE EMPTY LIST, largerHalf
;--------------------------------------------------------------------
(define (largerHalf lst fixedAverage) 
  (if (null? lst)
      ; Returns the list if empty
      lst
      ;----------------------------------------------------------
      ; Recursive function that calculates the larger half
      ; If the first element is greater than or equal to average
      ;----------------------------------------------------------
      (if (>= (car lst) fixedAverage)
          ;------------------------------------------------------
          ; If the first value IS greater than or equal to the
          ; average (TRUE), then the value is appended to the new
          ; list, largerHalf.
          ;------------------------------------------------------
          (append (largerHalf (cdr lst) fixedAverage) (list (car lst) )) 
          ;------------------------------------------------------
          ; If the first value is NOT greater than or equal to
          ; the average (FALSE), then the value is 'passed over'?
          ;------------------------------------------------------
          (largerHalf (cdr lst) fixedAverage) ) ))

;------------------------------------------------------------------ 
; smallerHalf FUNCTION DEFINITION
; The smaller half of the list, whatever is less than the average
; Parameters include lst and average(?)
; Average of the smaller half will need to be calculated
; APPEND NEEDS TO BE ADDED TO THE EMPTY LIST
;------------------------------------------------------------------
(define (smallerHalf lst fixedAverage)
  (if (null? lst)
      ; Returns the list if empty
      lst
      ;---------------------------------------------------------
      ; Recursive function that calculates the smaller half
      ; If the first element is less than or equal to average
      ;---------------------------------------------------------
      (if (< (car lst) fixedAverage)
          ;---------------------------------------------
          ; If the first value IS less than the average
          ; (TRUE), then the value is appended to the
          ; new list, smallerHalf.
          ;---------------------------------------------
          (cons (car lst) (smallerHalf (cdr lst) fixedAverage)  )
          ;---------------------------------------------
          ; If the first value is NOT less than average
          ; (FALSE), then the value is 'passed over'?
          ;---------------------------------------------
          (smallerHalf (cdr lst) fixedAverage) ) ))

;------------------------------------------------------------------ 
; equalTo FUNCTION DEFINITION
; To account for any values in the list that may be equal to average
; Parameters include lst and fixedAverage (the unchanging parameter)
;------------------------------------------------------------------
(define (equalTo lst fixedAverage) 
  (if (null? lst)
      ; Returns the list if empty
      lst
      ;----------------------------------------------------------
      ; Recursive function that calculates any equal values
      ; If the first element is equal to the fixedAverage
      ; We use fixedAverage so that the average of the list does
      ; not continually run through the function as the list
      ; elements are removed and appended.
      ;----------------------------------------------------------
      (if (= (car lst) fixedAverage)
          ;------------------------------------------------------------
          ; If the first value IS equal to the average,
          ; (TRUE), then the value is appended to the new list, 
          ; largerHalf. Recurse with the cdr of the list. Repeat
          ; until empty. Compare against the parameter, fixedAverage.
          ;------------------------------------------------------------
          (append (list (car lst)) (equalTo (cdr lst) fixedAverage)) 
          ;------------------------------------------------------
          ; If the first value is NOT greater than or equal to
          ; the average (FALSE), then the value is 'passed over'?
          ;------------------------------------------------------
          (equalTo (cdr lst) fixedAverage)) ))

;-----------------------------------------------------------------------
; FUNCTION CALL FOR myQuicksort
;-----------------------------------------------------------------------
; use (20 13 74 5 12 9 22 95 22 6 101 72 3 53 33 21 96) input
;(myQuicksort (list 20 13 74 5 12 9 22 95 22 6 101 72 3 53 33 21 96))
; returns '(3 5 6 9 12 13 20 21 22 22 33 53 72 74 95 96 101)

; TEST FUNCTIONS
;(lengthList (list 1 2 3 4 5))
;(sumList (list 1 2 3 4 5))
;(average (list 1 2 3 4 5))
;(smallerHalf (list 1 2 3 4 5) (average (list 1 2 3 4 5)))
(myQuicksort (list 8 3 4 7 9 12 11 5 1))