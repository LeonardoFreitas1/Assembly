org 0x0100

mov ah, 0x02
mov cl, 0x05
mov dl, 0x41

volta:
  call soma 
  loop volta
  
int 0x20
ret

soma:
  int 0x21
  inc dl
  ret
