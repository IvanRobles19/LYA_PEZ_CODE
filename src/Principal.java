
import java.io.File;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ivanr
 */
public class Principal {
    public static void main(String[] args) {
        String ruta ="C:/Users/Ivanr/Desktop/ProyectoAutomatas/src/LexerColor.flex";
        //String ruta ="C:/Users/Ivanr/Desktop/ProyectoAutomatas/src/Lexer.flex";
        generarLexer (ruta);
    }
    public static void generarLexer(String ruta){
        File archivo=new File(ruta);
        JFlex.Main.generate(archivo);
            
    }  
}
