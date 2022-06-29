/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ivanr
 */
public class tokenSintac {
    private String LexicoComp;
    private String Lexema;
    private int linea;
    private int columna;

    public tokenSintac(String LexicoComp, String Lexema, int linea, int columna) {
        this.LexicoComp = LexicoComp;
        this.Lexema = Lexema;
        this.linea = linea;
        this.columna = columna;
    }

        
    public String getLexicoComp() {
        return LexicoComp;
    }

    public void setLexicoComp(String LexicoComp) {
        this.LexicoComp = LexicoComp;
    }

    public String getLexema() {
        return Lexema;
    }

    public void setLexema(String Lexema) {
        this.Lexema = Lexema;
    }

    public int getLinea() {
        return linea;
    }

    public void setLinea(int linea) {
        this.linea = linea;
    }

    public int getColumna() {
        return columna;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }
    
    
    
}
