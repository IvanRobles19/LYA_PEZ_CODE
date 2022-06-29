/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ivanr
 */
public class PRUEBA {
    public static void main(String[] args) {
        String xs="Produccion(INICIO, 1, 1, 1, 1, [\n" +
        "Token(principal, INICIO, 1, 1)])\n" +
        "\n" +
        "....................................................................................................\n" +
        "Produccion(ACCION_CONTROL, 1, 11, 1, 11, [\n" +
        "Token(CONTROL, ACCION_CONTROL, 1, 11)])\n" +
        "\n" +
        "....................................................................................................\n" +

        "....................................................................................................\n" +
        "Produccion(SENTENCIAS, 3, 1, 29, 1, [\n" +
        "Token(ENTERO, TIPO_DATO, 3, 1),\n" +
        "Token(_PHIDEAL, IDENTIFICADOR, 3, 8),\n" +
        "Token(-->, Op_Asig, 3, 18),\n" +
        "Token(7, N_ENTERO, 3, 21),\n" +
        "Token(;, PUNTOyCOMA, 3, 23),\n" +
        "Token(ENTERO, TIPO_DATO, 4, 1),\n" +
        "Token(_PH, IDENTIFICADOR, 4, 8),\n" +
        "Token(-->, Op_Asig, 4, 12),\n" +
        "Token(MEDIR, ACCION_MEDIR, 4, 15),\n" +
        "Token(_S1, IDENTIFICADOR, 4, 22),\n" +
        "Token(;, PUNTOyCOMA, 4, 26),\n" +
        "Token(cadena, CADENA, 5, 1),\n" +
        "Token(_xd, IDENTIFICADOR, 5, 8),\n" +
        "Token(-->, Op_Asig, 5, 13),\n" +
        "Token('MEDICION DE PH', TEXTO, 5, 17),\n" +
        "Token(;, PUNTOyCOMA, 5, 34),\n" +
        "Token(_nose, IDENTIFICADOR, 12, 1),\n" +
        "Token(-->, Op_Asig, 12, 8),\n" +
        "Token(_NOSE2, IDENTIFICADOR, 12, 11),\n" +
        "Token(+, SUMA, 12, 18),\n" +
        "Token(15, N_ENTERO, 12, 19),\n" +
        "Token(;, PUNTOyCOMA, 12, 22),\n" +
        "Token(repetir, REPETIR, 15, 1),\n" +
        "Token((, PARENTESIS_A, 15, 9),\n" +
        "Token(_PHIdeal, IDENTIFICADOR, 15, 10),\n" +
        "Token(!=, DIFERENTE_DE, 15, 20),\n" +
        "Token(_PH, IDENTIFICADOR, 15, 24),\n" +
        "Token(), PARENTESIS_C, 15, 28),\n" +
        "Token({, LLAVE_A, 15, 29),\n" +
        "Token(ENTERO, TIPO_DATO, 16, 2),\n" +
        "Token(_nose, IDENTIFICADOR, 16, 9),\n" +
        "Token(-->, Op_Asig, 16, 16),\n" +
        "Token(4554, N_ENTERO, 16, 20),\n" +
        "Token(;, PUNTOyCOMA, 16, 25),\n" +
        "Token(si, ESTRUCTURA_SI, 18, 2),\n" +
        "Token((, PARENTESIS_A, 18, 5),\n" +
        "Token(_PHIdeal, IDENTIFICADOR, 18, 6),\n" +
        "Token(<, MENOR_QUE, 18, 15),\n" +
        "Token(_PH, IDENTIFICADOR, 18, 17),\n" +
        "Token(), PARENTESIS_C, 18, 20),\n" +
        "Token({, LLAVE_A, 18, 21),\n" +
        "Token(DISPENSAR, ACCION_DISPENSAR, 20, 3),\n" +
        "Token(_D1, IDENTIFICADOR, 20, 14),\n" +
        "Token(;, PUNTOyCOMA, 20, 17),\n" +
        "Token(_nose, IDENTIFICADOR, 21, 3),\n" +
        "Token(-->, Op_Asig, 21, 10),\n" +
        "Token(_NOSE, IDENTIFICADOR, 21, 15),\n" +
        "Token(+, SUMA, 21, 21),\n" +
        "Token(19, N_ENTERO, 21, 22),\n" +
        "Token(;, PUNTOyCOMA, 21, 25),\n" +
        "Token(}, LLAVE_C, 22, 2),\n" +
        "Token(si, ESTRUCTURA_SI, 23, 2),\n" +
        "Token((, PARENTESIS_A, 23, 5),\n" +
        "Token(_PHIdeal, IDENTIFICADOR, 23, 6),\n" +
        "Token(>, MAYOR_QUE, 23, 15),\n" +
        "Token(_PH, IDENTIFICADOR, 23, 17),\n" +
        "Token(), PARENTESIS_C, 23, 20),\n" +
        "Token({, LLAVE_A, 23, 21),\n" +
        "Token(DISPENSAR, ACCION_DISPENSAR, 25, 3),\n" +
        "Token(_D2, IDENTIFICADOR, 25, 14),\n" +
        "Token(;, PUNTOyCOMA, 25, 17),\n" +
        "Token(}, LLAVE_C, 26, 2),\n" +
        "Token(_PH, IDENTIFICADOR, 28, 3),\n" +
        "Token(-->, Op_Asig, 28, 7),\n" +
        "Token(MEDIR, ACCION_MEDIR, 28, 11),\n" +
        "Token(_S1, IDENTIFICADOR, 28, 17),\n" +
        "Token(;, PUNTOyCOMA, 28, 21),\n" +
        "Token(}, LLAVE_C, 29, 1)])\n" +
        "\n" +
        "....................................................................................................\n" +
        "Produccion(NOTIFICACION, 30, 1, 30, 53, [\n" +
        "Token(NOTIFICAR, ACCION_NOTIFICAR, 30, 1),\n" +
        "Token('LA REGULACION DE EL PH DE AH COMPLETADO', TEXTO, 30, 11),\n" +
        "Token(;, PUNTOyCOMA, 30, 53)])\n" +
        "\n" +
        "....................................................................................................\n" +
        "Produccion(FINAL, 33, 1, 33, 1, [\n" +
        "Token(final, FINAL, 33, 1)])";
        
        String automata=" ";
        int c=0;
        String[] loQueQuieroBuscar2 = {"INICIO","ACCION_CONTROL","VALOR","SENTENCIAS","NOTIFICACION","FINAL"};
        String loQueQuieroBuscar = "PUTO";
        for (int i = 0; i < loQueQuieroBuscar2.length; i++) {
            
        String[] palabras = loQueQuieroBuscar2[i].split("\\s+");
        for (String palabra : palabras) {
            if (xs.contains(palabra)) {
                automata+=" --> "+loQueQuieroBuscar2[i];
               // break;
                //aquí tu lógica en caso que se haya encontrado...
            }else{
                automata+=" --> X";
                c=1;
                break;}
        }
            if (c==1){break;}
        }//for
        System.out.println("automata = " + automata);
    }
}
