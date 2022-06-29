
import compilerTools.Token;

%%
%class Lexer
%type Token
%line
%column
L=[a-zA-Z_]+
D=[0-9]+
X=[']
P=[.]
Y=[#]
espacio=[ ,\t,\r,\n]+
%{
    private Token token(String lexeme, String lexicalComp, int line, int column){
        return new Token(lexeme, lexicalComp, line+1, column+1);}
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
    cad= {Letra}{Letra}*
    
    /*Bool*/
    //Bool= "VERDADERO" | "FALSO"

%%
{Comentario}|{EspacioEnBlanco} { /* Ignorar */ }

/* Identificador */
"_"{Identificador} { return token(yytext(), "IDENTIFICADOR", yyline, yycolumn); }

/* Numero */
{Numero}|{Numero_deci} { return token(yytext(), "N_ENTERO", yyline, yycolumn);}

/* Numero */
VERDADERO |
FALSO { return token(yytext(), "BOOL", yyline, yycolumn);}

/* Numero_deci */
Numero_deci { return token(yytext(), "N_DECIMAL", yyline, yycolumn);}

/*cad*/
"K_"{cad}= { return token(yytext(), "CADENA", yyline, yycolumn);}
    
/*TIPO DATO*/
NUMERO { return token(yytext(), "TIPO_DATO", yyline, yycolumn);}

MEDIR { return token(yytext(), "ACCION_MEDIR", yyline, yycolumn);}
DISPENSAR { return token(yytext(), "ACCION_DISPENSAR", yyline, yycolumn);}
LUZ { return token(yytext(), "ACCION_LUZ", yyline, yycolumn);}
CONTROL { return token(yytext(), "ACCION_CONTROL", yyline, yycolumn);}
NOTIFICAR { return token(yytext(), "ACCION_NOTIFICAR", yyline, yycolumn);}

logico { return token(yytext(), "LOGICO", yyline, yycolumn);}

cadena { return token(yytext(), "CADENA", yyline, yycolumn);} 



/* Operadores de agrupacion */
"(" { return token(yytext(), "PARENTESIS_A", yyline, yycolumn);}
")" { return token(yytext(), "PARENTESIS_C", yyline, yycolumn);}
"{" { return token(yytext(), "LLAVE_A", yyline, yycolumn);}
"}" { return token(yytext(), "LLAVE_C", yyline, yycolumn);}
"[" { return token(yytext(), "CORCHETE_A", yyline, yycolumn);}
"]" { return token(yytext(), "CORCHETE_C", yyline, yycolumn);}

/* Signos de apuntuacion */
"," { return token(yytext(), "COMA", yyline, yycolumn);}
"." { return token(yytext(), "PUNTO", yyline, yycolumn);}
";" { return token(yytext(), "PUNTOyCOMA", yyline, yycolumn);}
":" { return token(yytext(), "DOBLE_PUNTO", yyline, yycolumn);}

/* Operdador de asignacion */
"-->" { return token(yytext(), "Op_Asig", yyline, yycolumn);}


/* Operador Aritmetico */
"<" { return token(yytext(), "MENOR_QUE", yyline, yycolumn);}
">" { return token(yytext(), "MAYOR_QUE", yyline, yycolumn);}
"<=" { return token(yytext(), "MENOR_IGUAL_QUE", yyline, yycolumn);}
">=" { return token(yytext(), "MAYOR_IGUAL_QUE", yyline, yycolumn);}
"==" { return token(yytext(), "IGUAL_QUE", yyline, yycolumn);}
"!=" { return token(yytext(), "DIFERENTE_DE", yyline, yycolumn);}

/*OPERADORES DE MATEMATICAS */
"+" { return token(yytext(), "SUMA", yyline, yycolumn);}
"-" { return token(yytext(), "RESTA", yyline, yycolumn);}
"/" { return token(yytext(), "DIVISION", yyline, yycolumn);}
"*" { return token(yytext(), "MULTIPLICACION", yyline, yycolumn);}

/* OPERADOR LOGICO */
"&" |
"|" |
"!" { return token(yytext(), "OP_LOGICO", yyline, yycolumn);}

/* ciclos WHILE */
repetir |
repetirMientras { return token(yytext(), "REPETIR", yyline, yycolumn);}

/* detener */ 
interrumpir { return token(yytext(), "DETENER_REPETIR", yyline, yycolumn);}

/* Estructura Si IF */
si { return token(yytext(), "ESTRUCTURA_SI", yyline, yycolumn);}
no { return token(yytext(), "ESTRUCTURA_SI_NO", yyline, yycolumn);}

/* Final */
final { return token(yytext(), "FINAL", yyline, yycolumn);}

principal { return token(yytext(), "INICIO", yyline, yycolumn);}

/*FUNCIONES PARA EL SISTEMA*/

//FUNCION PARA MUTAR
mutar { return token(yytext(), "FUNCION_MUTAR", yyline, yycolumn);}

//FUNCION PARA EVALUAR
evaluar { return token(yytext(), "EVALUAR", yyline, yycolumn);}

//PALABRAS RESERVADAS PARA EVALUAR
fase1 |
fase2 |
fase3 |
fase4 |
fase5 |
fase6 { return token(yytext(), "FASES", yyline, yycolumn);}

//TEMPERATURA
"T"{Temperatura} { return token(yytext(), "TEMPERATURA", yyline, yycolumn);}

//FUNCION PARA FIJAR ORIGEN
fijar_Origen { return token(yytext(), "FUNCION FIJAR_ORIGEN", yyline, yycolumn);}

//FUNCION PARA EXPANDIR
expandir { return token(yytext(), "EXPANDIR", yyline, yycolumn);}

//FUNCION PARA ACTIVAR
activar {return token (yytext(), "ACTIVAR", yyline, yycolumn);}

//FUNCION PARA GENERAR GRAFICA
generar_graf { return token(yytext(), "GENERAR_GRAF", yyline, yycolumn);}

{X}(({EspacioEnBlanco})*({EspacioEnBlanco}|{L}|{D})*({EspacioEnBlanco})*)*{X} {return token(yytext(), "TEXTO", yyline, yycolumn);}


//NUMERO ERRONEO
0{Numero} { return token(yytext(), "ERROR_1", yyline, yycolumn);}

//IDENTIFICADOR ERRONEO
{Numero}{Identificador} { return token(yytext(), "ERROR_2", yyline, yycolumn);}
//IDENTIFICADOR ERRONEO
{Identificador} { return token(yytext(), "ERROR_3", yyline, yycolumn);}

. { return token(yytext(), "ERROR", yyline, yycolumn);}
