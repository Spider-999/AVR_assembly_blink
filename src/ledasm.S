; -------------------------------
; export asm subroutines to C/C++.

.global LedInit
.global LedOn
.global LedOff

; -------------------------------
; global variables in the data space.

.data
; .comm allocates storage in the data space(SRAM)
; then make the symbols global on the next line.

; -------------------------------
; data assembled in the .text section ends up
; in the flash storage of the program.
.text

.func LedInit
; void LedInit()
LedInit:
  ldi r18,0x1   ; load '1' into bit 0 of register 18.
  out 0x04,r18  ; set DDRB direction register bit 0 to output.
.endfunc

.func LedOn
; void LedOn()
LedOn:
  ldi r18,1     ; load '1' into bit 0 of register 18.
  out 0x05,r18  ; write '1' to PORTB to turn led on.
  ret           ; return to C/C++ file.
.endfunc

.func LedOff
; void LedOff()
LedOff:
  ldi r18,0     ; load '0' into bit 0 of register 18.
  out 0x05,r18  ; write '0' to PORTB to turn led off.
                ; PORTB is located at the address 0x05 because we use it as an IO port.
                ; An alternative would be to use the macro _SFR_IO_ADDR(PORTB).
  ret
.endfunc

