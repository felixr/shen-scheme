\* Copyright (c) 2012-2017 Bruno Deferrari.  All rights reserved. *\
\* BSD 3-Clause License: http://opensource.org/licenses/BSD-3-Clause *\

\\ TODO: handle relative dirs?
(define cd
  Val -> (let Dir (if (= Val "")
                      (scm.current-directory)
                      (scm.string-append Val "/"))
              NewDir (scm.current-directory Dir)
           (set *home-directory* (scm.current-directory))))

(define hash
  Val Bound -> (scm.fxmod (scm.equal-hash Val) (scm.exact Bound)))

(define not
  Val -> (scm.not Val))

(define boolean?
  Val -> (scm.boolean? Val))

(define integer?
  Val -> (scm.integer? Val))

(define variable?
  Val -> (scm.and
          (scm.symbol? Val)
          (scm.char-upper-case? (scm.string-ref (scm.symbol->string Val) 0))))

(define symbol?
  Val -> (scm.symbol? Val))

(define shen.pvar?
  V -> (scm.and
        (absvector? V)
        (scm.and
         (scm.fx>? (scm.vector-length V) 0)
         (= (scm.vector-ref V 0) shen.pvar))))

(define shen.numbyte?
  N -> (let N (scm.exact N)
         (scm.and (scm.fx>=? N 48) (scm.fx<=? N 57))))

(define shen.byte->digit
  N -> (scm.fx- (scm.exact N) 48))

(define dict
  Size -> (scm.make-eqv-hashtable (scm.exact Size)))

(define dict?
  X -> (scm.hashtable? X))

(define dict-count
  Dict -> (scm.hashtable-size Dict))

(define dict->
  Dict K V -> (scm.hashtable-set! Dict K V))

(define <-dict/or
  Dict K Or -> (let Res (scm.hashtable-ref Dict K $%value-not-found%$)
                 (if (scm.eq? Res $%value-not-found%$)
                     (thaw Or)
                     Res)))

(define dict-rm
  Dict K -> (scm.hashtable-delete! Dict K))

\* hashtable-fold defined in prelude.scm *\
(define dict-fold
  Dict F Init -> (scm.hashtable-fold Dict F Init))

(define dict-keys
  Dict -> (scm.hashtable-keys Dict))

(define dict-values
  Dict -> (scm.hashtable-values Dict))

(define exit
  Code -> (scm.exit Code))

(define value/or
  Var Or -> (scm.value/or Var Or))

(define <-address/or
  Vector N Or -> (if (>= N (scm.vector-length Vector))
                     (thaw Or)
                     (scm.vector-ref Vector N)))

\* read-file-as-* defined in prelude.scm *\

(define read-file-as-bytelist
  Filename -> (scm.read-file-as-bytelist Filename))

(define read-file-as-charlist
  Filename -> (scm.read-file-as-bytelist Filename))

(define read-file-as-string
  Filename -> (scm.read-file-as-string Filename))
