module DataHand.Layouts.ProgrammerDvorak (eric, kristof) where
import DataHand.Layout
import DataHand.Keys
import DataHand.KeyAliases

-- NOTEs on my adaptation of "Progammer Dvorak":
-- Why the keys '[', ']' dont match is explained on his webpage. It took me awhile to realize
-- he shifts his fingers not along the normal columns! (instead he moves index fingers F->5,J->8)
-- His rationale is that typing "]-" is awkward (for right placement) and
-- that breaking up {} is not an option (for left placement; this one makes
-- a lot less sense to me, since they shouldnt be on the same side to begin with.
--
-- My thinking is that on the datahand, you must use a metakey to access BOTH numbers and symbols,
-- so having numbers vs. symbols on the home row is largely the same. I
-- preserve the datahand mapping idiom for the classic dvorak number sequence,
-- however.
--
-- $ &[{}( =  * )+]! #
-- ~ %7531 9  0 2468 `
--       becomes
--    &[{(      )}]!
--    7531 9  8 0246
--    ~%$=      *#+`
--  The higher frequency of lower digits is real. Classic dvorak was invented
--  before the digital age, but since then, the frequency of 0 has far exceeded
--  all other even numerals, hence my shifting of them rightwards. I was quite
--  suprised at how much better this arrangement served me.

eric = Layout {
-- high prio symbols: ,. :; '" - /? | @ # `
--                    + \
-- Rules, rationale:
--   * QuestionMark and other punctuanion on left hand because most words end with
--     consonants (i think that's the original dvorak reasoning).
--
--   * forwardslash + nas = backslash
    normal = Layer
--       +----+           +----+           +----+           +----+
          scol              com              per              P
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      At   A   dash    dol  O    X     Pipe  E    Y     fslh  U    I      ret lwin  Tab
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
           sqt              Q                J                K          Norm shft lctl
--       +----+           +----+           +----+           +----+      +----+----+----+

--                        +----+           +----+           +----+           +----+
                            G                C                R                L
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     bksp nasl  sp     D    H    esc    F    T   lwin    B    N   lapp    del  S   prsc
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      Alt  NAS  fn          M                W                V                Z  
--  +----+----+----+      +----+           +----+           +----+           +----+     

  , normalS = Layer
--       +----+           +----+           +----+           +----+
           ø                qm              Bang              ø
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      til  ø    ø     Hash  ø    ø      amp  ø    ø     bslh  ø    ø      ø    ø    ø
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
           ø                ø                ø                ø           ø    ø    ø
--       +----+           +----+           +----+           +----+      +----+----+----+

--                        +----+           +----+           +----+           +----+
                            ø                ø                ø                ø
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      ø    ø    ø      ø    ø    ø      ø    ø    ø      ø    ø    ø      ø    ø    ø
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      ø    ø    ø           ø                ø                ø                ø     
--  +----+----+----+      +----+           +----+           +----+           +----+     

  , nas = Layer
--      +----+           +----+           +----+           +----+
          lab              lb               lcb              lp
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     ø    svn Plus    ø   Five  ø      lab  thr  rab    til  One Nine    ø   caps  ø
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
         bktk             perc              ø                eq          ø    ø    ø 
--      +----+           +----+           +----+           +----+      +----+----+----+

--                       +----+           +----+           +----+           +----+
                           rp              rcb               rb               rab
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     ø    ø    ø     eigt Zero Caret   lab  Two  rab    ø   Four  ø      ins  Six  ø
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     ø    ø    ø           ast              ø                ø                til
-- +----+----+----+      +----+           +----+           +----+           +----+     
  , nasS = EmptyLayer
  , function = Layer
--      +----+           +----+           +----+           +----+
          ø                ø               pgup              up
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     F11  ø    F9     F7   ø    F5     F3  End   F1   left Home rite     ø    ø    ø
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
          ø                ø               pgdn             down         ø    ø    ø
--      +----+           +----+           +----+           +----+      +----+----+----+

--                       +----+           +----+           +----+           +----+
                           up              pgup             prsc              ø
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     ø    ø    ø     left Home rite    F2   End  F4     F6   ø    F8     F10  ø    F12
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     ø    ø    ø          down             pgdn              ø                ø
-- +----+----+----+      +----+           +----+           +----+           +----+     
  , functionS = EmptyLayer
  , tenk = EmptyLayer
  , tenkS = EmptyLayer
  }

kristof = Layout {
-- high prio symbols: ,. :; '" - /? | @ # `
--   Eric's, but with space and enter swapped
    normal = Layer
--       +----+           +----+           +----+           +----+
          scol              com              per              P
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      At   A   dash    dol  O    X     Pipe  E    Y     fslh  U    I       sp lwin  Tab
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
           sqt              Q                J                K          Norm shft lctl
--       +----+           +----+           +----+           +----+      +----+----+----+

--                        +----+           +----+           +----+           +----+
                            G                C                R                L
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     bksp nasl  ret    D    H    esc    F    T   lwin    B    N   lapp    del  S   prsc
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      Alt  NAS  fn          M                W                V                Z  
--  +----+----+----+      +----+           +----+           +----+           +----+     

  , normalS = Layer
--       +----+           +----+           +----+           +----+
           ø                qm              Bang              ø
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      til  ø    ø     Hash  ø    ø      amp  ø    ø     bslh  ø    ø      ø    ø    ø
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
           ø                ø                ø                ø           ø    ø    ø
--       +----+           +----+           +----+           +----+      +----+----+----+

--                        +----+           +----+           +----+           +----+
                            ø                ø                ø                ø
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      ø    ø    ø      ø    ø    ø      ø    ø    ø      ø    ø    ø      ø    ø    ø
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      ø    ø    ø           ø                ø                ø                ø     
--  +----+----+----+      +----+           +----+           +----+           +----+     

  , nas = Layer
--      +----+           +----+           +----+           +----+
          lab              lb               lcb              lp
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     ø    svn Plus    ø   Five  ø      lab  thr  rab    til  One Nine    ø   caps  ø
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
         bktk             perc              ø                eq          ø    ø    ø 
--      +----+           +----+           +----+           +----+      +----+----+----+

--                       +----+           +----+           +----+           +----+
                           rp              rcb               rb               rab
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     ø    ø    ø     eigt Zero Caret   lab  Two  rab    ø   Four  ø      ins  Six  ø
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     ø    ø    ø           ast              ø                ø                til
-- +----+----+----+      +----+           +----+           +----+           +----+     
  , nasS = EmptyLayer
  , function = Layer
--      +----+           +----+           +----+           +----+
          ø                ø               pgup              up
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     F11  ø    F9     F7   ø    F5     F3  End   F1   left Home rite     ø    ø    ø
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
          ø                ø               pgdn             down         ø    ø    ø
--      +----+           +----+           +----+           +----+      +----+----+----+

--                       +----+           +----+           +----+           +----+
                           up              pgup             prsc              ø
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     ø    ø    ø     left Home rite    F2   End  F4     F6   ø    F8     F10  ø    F12
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     ø    ø    ø          down             pgdn              ø                ø
-- +----+----+----+      +----+           +----+           +----+           +----+     
  , functionS = EmptyLayer
  , tenk = EmptyLayer
  , tenkS = EmptyLayer
  }

-- TODO: dvorak in cyrillic
dvorak_cyrillic = Layout {
    normal = EmptyLayer
  , normalS = EmptyLayer
  , nas = EmptyLayer
  , nasS = EmptyLayer
  , function = EmptyLayer
  , functionS = EmptyLayer
  , tenk = EmptyLayer
  , tenkS = EmptyLayer
  }

-- XXX incomplete, probably should be abandoned
strict = Layout {
    normal = Layer
--       +----+           +----+           +----+           +----+
          scol              com              per              P
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      del  A   fslh    esc  O    X     bktk  E    Y      dqt  U    I      ret caps  Tab   
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
           sqt              Q                J                K          Norm shft lctl
--       +----+           +----+           +----+           +----+      +----+----+----+

--                        +----+           +----+           +----+           +----+
                            G                C                R                L
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     bksp nasl  sp     D    H    sqt    F    T    col    B    N   pent    At  dash bslh
--  +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
      Alt  NAS  fn          M                W                V                Z  
--  +----+----+----+      +----+           +----+           +----+           +----+     

  , normalS = EmptyLayer
  , nas = Layer
--      +----+           +----+           +----+           +----+
         perc              svn             Five              thr
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     del  amp  dol    esc lb   numl    ø   lcb   ø      ø   rcb   lp     ret caps  Tab   
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
          ø                ø                ø                ø          Norm shft lctl
--      +----+           +----+           +----+           +----+      +----+----+----+

--                       +----+           +----+           +----+           +----+
                          Zero             Two              Four             Six
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
    bksp nasl  sp     eq  ast  Bang   Nine  rp   ø      ø    ø    ø      ø    ø    ø  
-- +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+ +----+----+----+
     Alt  NAS  fn          ø                ø                ø                ø  
-- +----+----+----+      +----+           +----+           +----+           +----+     
  , nasS = EmptyLayer
  , function = EmptyLayer
  , functionS = EmptyLayer
  , tenk = EmptyLayer
  , tenkS = EmptyLayer
    }

