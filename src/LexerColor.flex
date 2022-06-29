
import compilerTools.TextColor;
import java.awt.Color;

%%
%class LexerColor
%type TextColor
%char
L=[a-zA-Z_]+
D=[0-9]+
X=[']
P=[.]
Y=[#]
espacio=[ ,\t,\r,\n]+
%{
    private TextColor textColor(long start, int size, Color color){
        return new TextColor((int)start, size, color);
    }
%}
/*Variables basicas de comentarios y espacios */
    TerminadorDeLinea = \r|\n|\r\n
    EntradaDeCaracter = [^\r\n]
    EspacioEnBlanco     = {TerminadorDeLinea} | [ \t\f]
    ComentarioTradicional   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
    FinDeLineaComentario     = "//" {EntradaDeCaracter}* {TerminadorDeLinea}?
    ContenidoComentario       = ( [^*] | \*+ [^/*] )*
    ComentarioDeDocumentacion = "/**" {ContenidoComentario} "*"+ "/"

    /* Comentario */
    Comentario = {ComentarioTradicional} | {FinDeLineaComentario} | {ComentarioDeDocumentacion}

   
    /* Identificador */
    Letra = [A-Za-zÑñ_áéíóú]
    Digito = [0-9]
    Identificador = {Letra}({Letra}|{Digito})*
    
    /* Numero */
    Numero = 0 | [1-9][0-9]*

    /* Numero_deci */
    Numero_deci = [1-9][0-9]* "." [0-9]* | 0 "." [0-9] [0-9]*

    /* Temperatura */
    Temperatura =  {Numero} | {Numero_deci}
    
    /*cad*/
    cad= {Letra} {Letra}*
    
    /*Bool*/
    //Bool= "VERDADERO" | "FALSO"
    

%%
{Comentario} { return textColor(yychar, yylength(), new Color(146, 146, 146));}
{EspacioEnBlanco} {/* Ignorar */ }

/* Identificador */
"_"{Identificador} { return textColor(yychar, yylength(), new Color(255, 200, 0)); }

/* Bool */
VERDADERO |
FALSO  { return textColor(yychar, yylength(), new Color(255, 0, 255));}

/* Numero */
{Numero} { return textColor(yychar, yylength(), new Color(35, 120, 147));}

/* Numero_deci */
Numero_deci { return textColor(yychar, yylength(), new Color(35, 120, 147));}

/*cad*/
"K_"{cad} {return textColor(yychar, yylength(), new Color(255, 0, 255));}
    
/*TIPO DATO*/
NUMERO  |
DOBLE |
FLOTANTE |
logico |
cadena { return textColor(yychar, yylength(), new Color(0, 0, 255));} 


MEDIR |
DISPENSAR |
LUZ |
CONTROL |
NOTIFICAR { return textColor(yychar, yylength(), new Color(255,175,175));}

/* Operadores de agrupacion */
"(" | ")" | "{" | "}" | "[" | "]" { return textColor(yychar, yylength(), new Color(100, 149, 237));}

/* Signos de apuntuacion */
"," | "." | ";" | ":" { return textColor(yychar, yylength(), new Color(0, 0, 0));}

/*OPERADORES DE MATEMATICAS*/
"+" { return textColor(yychar, yylength(), new Color(124, 252, 0));}
"-" { return textColor(yychar, yylength(), new Color(124, 252, 0));}
"/" { return textColor(yychar, yylength(), new Color(124, 252, 0));}
"*" { return textColor(yychar, yylength(), new Color(124, 252, 0));}

/* Operdador de asignacion */
"-->" { return textColor(yychar, yylength(), new Color(102, 205, 170));}

/* Operador Aritmetico */
"<" | ">" | "<=" | ">=" | "==" | "!=" { return textColor(yychar, yylength(), new Color(102, 205, 170));}

/* OPERADOR LOGICO */
"&" | "|" | "!" { return textColor(yychar, yylength(), new Color(102, 205, 170));}

/* ciclos */
repetir |
repetirMientras {  return textColor(yychar, yylength(), new Color(102, 205, 170));}

/* detener */ 
interrumpir { /* Ignorar */ }

/* Estructura Si */
si |
no { return textColor(yychar, yylength(), new Color(102, 205, 170)); }

/* Final */
final { return textColor(yychar, yylength(), new Color(255,175,175));}
/* inicio */
principal { return textColor(yychar, yylength(), new Color(255,175,175));}

/*FUNCIONES PARA EL SISTEMA*/

//FUNCION PARA MUTAR
mutar { return textColor(yychar, yylength(), new Color(0, 144, 255));}

//FUNCION PARA EVALUAR
evaluar { return textColor(yychar, yylength(), new Color(0, 144, 255));}

//PALABRAS RESERVADAS PARA EVALUAR
fase1 |
fase2 |
fase3 |
fase4 |
fase5 |
fase6 { return textColor(yychar, yylength(), new Color(0, 0, 255)); }

//TEMPERATURA
"T"{Temperatura} { return textColor(yychar, yylength(), new Color(0, 0, 255)); }

//FUNCION PARA FIJAR ORIGEN
fijar_Origen { return textColor(yychar, yylength(), new Color(0, 144, 255));}

//FUNCION PARA EXPANDIR
expandir {return textColor(yychar, yylength(), new Color(0, 144, 255));}

//FUNCION PARA GENERAR GRAFICA
generar_graf { return textColor(yychar, yylength(), new Color(0, 144, 255));}

//FUNCION PARA ACTIVAR
activar {return textColor(yychar, yylength(), new Color(225, 181, 29));}

// texto
{X}(({EspacioEnBlanco})*({EspacioEnBlanco}|{L}|{D})*({EspacioEnBlanco})*)*{X} {return textColor(yychar, yylength(), new Color(0, 255, 0));}


//NUMERO ERRONEO
0{Numero} { return textColor(yychar, yylength(), new Color(225, 0, 0)); }
//IDENTIFICADOR ERRONEO
{Numero}{Identificador} { return textColor(yychar, yylength(), new Color(225, 0, 0)); }

. { return textColor(yychar, yylength(), new Color(225, 0, 0)); }