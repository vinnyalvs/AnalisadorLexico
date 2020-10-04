
%%

%unicode
%line
%column
%class LexerLang
%function nextToken
%type Token


%{
   StringBuffer string = new StringBuffer();

  private Token symbol(TOKEN_TYPE type) {
    return new Token(type, yytext(),yyline+1, yycolumn+1); 
  }
  private Token symbol(TOKEN_TYPE type, Object value) {
    return new Token(type, value, yyline+1, yycolumn+1);
  }
%}

/*macros*/

FimDeLinha = \r|\n|\r\n
Brancos     = {FimDeLinha} | [ \t\f]
Minusculas=[:lowercase:]
Maiusculas=[:uppercase:]
Letras =  [:letter:]      
Digito = [:digit:] 
Identificador = {Letras}(_|{Digito}|{Letras})* 
literal_inteiro = {Digito}{Digito}*
literal_ponto_flutuante = {Digito}*"."{Digito}+

nome_tipo = {Maiusculas}([^\s]|{Digito}|{Letras})* 
literal_logico = true|false
literal_null = null 
literal_caractere= "'"((.)|\\(n|t|b|r|\\|"'"))"'"

/* comentários */
Comentario = {ComentarioMultiplasLinhas} | {ComentarioLinha} 

ComentarioMultiplasLinhas   = "{-" [^*] ~"-}" | "{-" "-"+ "}"
ComentarioLinha     = "--".*

%%

/* keywords */


<YYINITIAL> {
  /* literais */
  {literal_logico}            { return symbol(TOKEN_TYPE.LOGICAL_LITERAL); }
  {literal_null}              { return symbol(TOKEN_TYPE.NULL_LITERAL); }
  {literal_inteiro}           { return symbol(TOKEN_TYPE.INTEGER_LITERAL,Integer.parseInt(yytext())); }
  {literal_ponto_flutuante}   { return symbol(TOKEN_TYPE.FLOAT_LITERAL,Float.parseFloat(yytext())); }
  {literal_caractere}         { return symbol(TOKEN_TYPE.CHAR_LITERAL); }

   /* identificadores */ 
   
  {nome_tipo}                   { return symbol(TOKEN_TYPE.NAME_TYPE); }
  {Identificador}                { return symbol(TOKEN_TYPE.ID); }
  
    


   /* operadores e separadores */
    "="                            { return symbol(TOKEN_TYPE.EQ); }
    "=="                           { return symbol(TOKEN_TYPE.EQEQ); }
    "+"                            { return symbol(TOKEN_TYPE.PLUS); }
    "("                            { return symbol(TOKEN_TYPE.OP_PARENTHESIS); }
    ")"                            { return symbol(TOKEN_TYPE.CL_PARENTHESIS); }
    "["                            { return symbol(TOKEN_TYPE.OP_SQBRACKET); }
    "]"                            { return symbol(TOKEN_TYPE.CL_SQBRACKET); }
    "{"                            { return symbol(TOKEN_TYPE.OP_BRACKET); }
    "}"                            { return symbol(TOKEN_TYPE.CL_BRACKET); }
    ";"                            { return symbol(TOKEN_TYPE.SEMI); }
    "."                            { return symbol(TOKEN_TYPE.DOT); }
    ","                            { return symbol(TOKEN_TYPE.COMMA); }
    "<"                            { return symbol(TOKEN_TYPE.RELACIONAL); }
    "!="                           { return symbol(TOKEN_TYPE.DIFF); }
    "-"                            { return symbol(TOKEN_TYPE.MINUS); }
    "*"                            { return symbol(TOKEN_TYPE.TIMES); }
    "/"                            { return symbol(TOKEN_TYPE.DIV); }
    "%"                            { return symbol(TOKEN_TYPE.MOD); }
    "&&"                           { return symbol(TOKEN_TYPE.AND); }
    "!"                            { return symbol(TOKEN_TYPE.DENY); }   

  /* Comentários */
  {Comentario}                      { /* ignore */ }
  
  /* Espaço em */
  {Brancos}                   { /* ignore */ }
}


/* error fallback */
[^] { throw new Error("Poxa =/, Voce digitou um caractere invalido na linha: " +(yyline+1) + " coluna: " + (yycolumn+1)  + " " + yytext() ); }

                                                        
                                    