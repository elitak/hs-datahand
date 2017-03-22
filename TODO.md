###TODO
* Norm is really windows key
* Fn mode doesnt stick
* figure out actual keycodes and which is actual winkey
* add mouse support
add a bunch of debug features by holding debug key on back + some letter to do various things like dump keymap as txt, do a LED test, etc.
  holding it 5s prints out help menu via keystrokes


### imported todos
* rust rewrite of the datahand  Driver if I can't do the Haskell on the stm32 and see if I can just run rust on the teensy
* datahand combined with 443MHz radio + IR transmitter, for control of light, projector


#### TODOs moved here from ProgrammerDvorak layout .hs
-- TODO use some 2d rendering to make an image of the map, ideally one that looks similar to the original stickers.
-- TODO does it make sense to leave ;: '" <> /? @^ #` -_ out of NAS? These keys are
--      there because of original prog-dvorak placement. I get the utility of having
--      their unshifted halves one keystroke away, but having some symbols accessed
--      by shift+ and others by NAS+ may not be as conceptually clean as other
--      solutions.
--      Maybe add the shifter versions into side-keys in NAS like orig.datahand did?
--      The orig layout added <> :; ,. /? (no \|)which were all already accessible in Normal mode
-- TODO DO 10k LAYER and support HEX ENTRY easily (have a-f, h as suffix, 0x prefix macro, ", 0x" macro maybe even
-- TODO MACRO SUPPORT for situations like the above.
-- TODO support exotic shift states to dhteensy like @^ key in prog.dv, maybe by adding a separate Shift key layer
-- TODO maybe switch out @ for something used more frequently like #+*
-- TODO BETTER FNMOUSE/ARROWS: have fn lever go to last fn state, then cycle fn
--      types [arrows, mouse, more if desired]. Thereafter, use Norm to return, and
--      then Fn to switch back to last Fn mode in that list. This frees up the two
--      middle finger buttons for more useful binds.
-- TODO Add FnArrow+NAS mode that turns arrow keys into pageup,down,home,end
-- TODO naslock and capslock are pretty much wasted. i can hold the damn key
--      down just fine, thanks. instead, make naslock go to 10kmode and capslock
--      cycle whole layouts, maybe. i may want to put capslock somewhere buried in
--      NAS, just in case i ever need it.
-- TODO Profile switching: hold both locks and press a home row key to select
--      that slot. or release a lock key last to cycle the opposite direction.
-- TODO USB connection to other hand, attach as separate devices? usb3 micro connector has uart lines apparently? used in ergodox infinity this way, i read.
-- TODO: NAS col, dqt, etc locations are same as Normal?
--   * copy, paste, etc macros that are portable; alt-tab on single key on left-hand side
--   * gnu screen: ctrl-a, ctrl-a n/p, " etc.
--   * xmonad bindings
-- TODO missing fn keys like printscreen,scrolllock, numlock
-- TODO have winkey be both levers simulaneously pressed
-- TODO C-a a,n,p,[,] macros for screen
-- TODO give some thought to the difficulty i have typing ("1");
-- TODO FEATURE consider chording support for games. this is probably better/faster than hard to reach directional buttons. research what timing thresholds and behavior are most usable with chording. There is an inherent, unavoidable collision when mashing 2 buttons. Do I send both original keypresses anyway?(requires keymap accomodations to not send superfluous commands) or do i wait for a chord 50ms or so? (then all regular keys are unresponsive!) a middle ground would be to have some keys "chordable" meaning they would always exhibit the delay, and have others remain fully responsive.
-- times when superflous keys would be okay:
--   * modal menus in rtses, so long as underlying keys dont share binds
--   * not many others, lol. this method seems pretty undesirable.

