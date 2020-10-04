
import java.io.*;

public class LangReader{
    public static void  main(String args[]) throws Exception {
        LexerLang lx = new LexerLang(new FileReader("./exemplo.txt"));
        Token t = lx.nextToken();
        while( t != null){
            System.out.println(t.output());
            t = lx.nextToken();
        }
        System.out.println("Fim da leitura!");

    } 
}