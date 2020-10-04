/* 
   Edson Lopes da Silva Júnior 201635023
   Vinicius Alberto Alves da Silva 201665558C 
*/

import java.io.FileReader;

public class LangReader{
    public static void  main(String args[]) throws Exception {
        LexerLang lx = new LexerLang(new FileReader(args[1]));
        Token t = lx.nextToken();
        while( t != null){
            System.out.println(t.output());
            t = lx.nextToken();
        }
        System.out.println("Fim da leitura!");

    } 
}