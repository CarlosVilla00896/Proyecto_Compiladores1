import java.io.*;

public class Main {
    public static void main(String args[]){
        try{
            Lexer lexer = new Lexer( new FileReader( args[0] ));
            lexer.yylex();
        }catch( Exception e ){
        }
    }
}