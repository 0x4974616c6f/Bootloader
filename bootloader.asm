xor ax, ax
mov cs, ax
mov ds, ax
mov es, ax


;---------------------------------------------------------------------------


;Gerar modo de video
;  13h  G   40x25  8x8   320x200  256/256K  1   A000  VGA,MCGA
mov al, 0x13
int 0x10
;Finalizado

;Chamar Fundo branco
call DesenhaFundoBranco


;Agora que o fundo esta branco precisa escrever a frase
call BotaFrase


;Desenho
call Desenha

;acabou

jmp $

;---------------------------------------------------------------------------

DesenhaFundoBranco: 
push bp
mov bp, sp
pusha 

;Int 10h, 0Ch            Write Pixel
;
;   Writes a pixel dot of a specified color at a specified screen
;    coordinate.
;
;        Entry   AH = 0Ch
;                AL = Pixel color
;                CX = Horizontal position of pixel
;                DX = Vertical position of pixel
;                BH = Display page number (graphics modes with more
;                     than 1 page)
;
;        Return  Nothing



popa
mov sp, bp
pop bp
ret



;---------------------------------------------------------------------------

;Variaveis
mensagem: db 'ME CONTRATA =D'

;finalizando
times(510 - ($ - $$)) db 0x00
dw 0xAA55