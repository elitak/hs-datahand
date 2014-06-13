module DataHand.Keys where

data Key = NoEvent
         | ErrorRollOver
         | POSTFail
         | ErrorUndefined
         | A
         | B
         | C
         | D
         | E
         | F
         | G
         | H
         | I
         | J
         | K
         | L
         -- 0x10
         | M
         | N
         | O
         | P
         | Q
         | R
         | S
         | T
         | U
         | V
         | W
         | X
         | Y
         | Z
         | One
         | Two
         -- 0x20
         | Three
         | Four
         | Five
         | Six
         | Seven
         | Eight
         | Nine
         | Zero
         | Return
         | Escape
         | Backspace
         | Tab
         | Space
         | Minus
         | Equal
         | LeftBracket
         -- 0x30
         | RightBracket
         | BackSlash
         | Number -- XXX I think this is Ellipsis or INT2
         | Semicolon
         | Quote
         | BackTick
         | Comma
         | Period
         | Slash
         | CapsLock
         | F1
         | F2
         | F3
         | F4
         | F5
         | F6
         -- 0x40
         | F7
         | F8
         | F9
         | F10
         | F11
         | F12
         | PrintScreen
         | ScrollLock
         | Pause
         | Insert
         | Home
         | PageUp
         | Delete
         | End
         | PageDown
         | RightArrow
         -- 0x50
         | LeftArrow
         | DownArrow
         | UpArrow
         | NumLock
         | PadSlash
         | PadAsterix
         | PadMinus
         | PadPlus
         | PadEnter
         | Pad1
         | Pad2
         | Pad3
         | Pad4
         | Pad5
         | Pad6
         | Pad7
         -- 0x60
         | Pad8
         | Pad9
         | Pad0
         | PadPeriod
         | Int1
         | Application
         | Power
         | PadEqual
         | F13
         | F14
         | F15
         | F16
         | F17
         | F18
         | F19
         | F20
         -- 0x70
         | F21
         | F22
         | F23
         | F24
         | Execute
         | Help
         | Menu
         | Select
         | Stop
         | Again
         | Undo
         | Cut
         | Copy
         | Paste
         | Find
         | Mute
         -- 0x80
         | VolumeUp
         | VolumeDown
         | LockingCapsLock
         | LockingNumLock
         | LockingScrollLock
         | PadComma
         | PadEqualAgain
         | Internat1
         | Internat2
         | Internat3
         | Internat4
         | Internat5
         | Internat6
         | Internat7
         | Internat8
         | Internat9
         -- 0x90
         | Lang1
         | Lang2
         | Lang3
         | Lang4
         | Lang5
         | Lang6
         | Lang7
         | Lang8
         | Lang9
         | AltErase
         | SysRq
         | Cancel
         | Clear
         | Prior
         -- HACK FIXME the next set of symbols are actually shifted versions of the
         -- keys (i.e. + 0x80). I don't know if this is the correct way to
         -- represent these keys. I think maybe there's another register for
         -- metakeystate that I need to be dealing with. I'm not, for now, and
         -- these produce the same result anyway and can be shifted back (i
         -- think).
         | Bang
         | At
         -- 0xA0
         | Hash
         | Dollar
         | Percent
         | Caret
         | Ampersand
         | Asterisk
         | LeftParenthesis
         | RightParenthesis
         | ShiftReturn
         | ShiftEscape
         | ShiftBackspace
         | ShiftTab
         | ShiftSpace
         | ShiftMinus
         | Plus
         | LeftCurlyBracket
         -- 0xB0
         | RightCurlyBracket
         | Pipe
         | ShiftNumber -- what is shift+"number"???
         | Colon
         | DoubleQuote
         | Tilde
         | LeftAngleBracket
         | RightAngleBracket
         | QuestionMark
         -- end HACKed keycodes
         | DummyB9
         | DummyBA
         | DummyBB
         | DummyBC
         | DummyBD
         | DummyBE
         | DummyBF
         -- 0xC0
         | DummyC0
         | DummyC1
         | DummyC2
         | DummyC3
         | DummyC4
         | DummyC5
         | DummyC6
         | DummyC7
         | DummyC8
         | DummyC9
         | DummyCA
         | DummyCB
         | DummyCC
         | DummyCD
         | DummyCE
         | DummyCF
         -- 0xD0
         | DummyD0 | DummyD1 | DummyD2 | DummyD3 | DummyD4 | DummyD5 | DummyD6 | DummyD7
         | DummyD8 | DummyD9 | DummyDA | DummyDB | DummyDC | DummyDD | DummyDE | DummyDF
         -- 0xE0
         | LeftControl
         | LeftShift
         | LeftAlt
         | LeftGUI
         | RightControl
         | RightShift
         | RightAlt
         | RightGUI
         | DummyE8 | DummyE9 | DummyEA | DummyEB | DummyEC | DummyED | DummyEE | DummyEF
         -- 0xf0 : special datahand keycodes follow
         | Norm --FIXME this is like windows key???
         | NAS
         | NASLock
         | Function
         -- these are different codes from 'regular' keyboard metakeys
         | Shift
         | Control
         | Alt
         deriving (Show, Eq, Ord, Bounded, Enum)
