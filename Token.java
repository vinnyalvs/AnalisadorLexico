/* 
    Edson Lopes da Silva Júnior 201635023
   Vinicius Alberto Alves da Silva 201665558C 
*/

public class Token{
    public int l, c;
    public TOKEN_TYPE t;
    public String lexeme;
    public Object info;

    public Boolean isReservedToken(TOKEN_TYPE token){

       switch(token) {
        case ID: 
        case NAME_TYPE:
        case IF:
        case ELSE:
        case ITERATE:
        case READ:
        case PRINT:
        case RETURN:
        case DATA:
        case NEW:
        case INT:
        case CHAR:
        case BOOL:
        case FLOAT:
        case INTEGER_LITERAL:
        case FLOAT_LITERAL:
        case CHAR_LITERAL:
        case LOGICAL_LITERAL:
        case NULL_LITERAL:
            return true;
        default:
            return false;
     }
    }

    public Token (TOKEN_TYPE t, String lex, int l, int c){
        this.t = t;
        lexeme = lex;
        info = null;
        this.l = l;
        this.c = c;
    }

    public Token(TOKEN_TYPE t, Object o, int l, int c){
        this.t = t;
        lexeme = "";
        info = o;
        this.l = l;
        this.c = c;
    }

    @Override
    public String toString(){
        return "[("+ t + "," + c + t + ") \"" + lexeme + "\" : < " + (info == null ? "" : info.toString())+">]";
    }

    public String output(){
        String text = (info == null ? lexeme : info.toString());
        if(isReservedToken(t))
            return  t + ":" + text;
        else 
            return text;
    }
}

