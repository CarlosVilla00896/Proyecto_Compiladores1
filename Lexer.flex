
%%
%class Lexer
%line 
%column
%int 
%unicode
%state COMMENT
%state STRING_LITERAl
%{
    Public String buffer = "";
%}

Letter = [a-zA-Z]
Digit = [0-9]
Identifier = {Letter}({Letter}|{Digit}|_)* | _{Letter}({Letter}|{Digit}|_)*
LineBreak = [\n|\r\n]
Space = [" "]+
QuotationMark = [\"]
String = {QuotationMark} ({Letter}|{Digit})+ {QuotationMark}
Number = {Digit}+|{Digit}+"."+{Digit}+
Integer = "Integer"
Boolean = "Boolean"
Double = "Double"
String = "String"
For = "For"
While = "While"
Module = "Module"
Do = "Do"
Loop = "Loop"
End = "End"
Next = "Next"
Step = "Step"
Continue = "Continue"
To = "To"
Until = "Until"
Or = "Or"
And = "And"
Not = "Not"
Mod = "Mod"
Function = "Function"
Sub = "Sub"
Dim = "Dim"
As = "As"
True = "True"
False = "False"
If = "If"
Else = "Else"
Then = "Then"
Structure = "Structure"
Return = "Return"
Console = "Console"
WriteLine = "WriteLine"
ReadLine = "ReadLine"
DivMult= ["/"|"*"]
AddSub = ["+"|"-"]
ConcatOperator = "&"
RelationalOperators = [<>|<|>|>=|<=]
EqualOperator = "="
Point = "."
LeftParenthesis = "("
RightParenthesis = ")"
LefttBrace = "{"
RightBrace = "}"
LeftSquareBracket = "["
RigthSquareBracket = "]"
SingleQuote = "'"

%%

<YYINITAL> {
    {SingleQuote}           {System.out.println("<Commentary>");yybegin(COMMENT);}
    {Boolean}               {System.out.println("<Boolean>");}
    {Integer}               {System.out.println("<Integer>");}
    {Double}                {System.out.println("<Double>");}
    {String}                {System.out.println("<String>");}
    {For}                   {System.out.println("<For>");}
    {While}                 {System.out.println("<Double>");}
    {Module}                {System.out.println("<Module Sentence, Module>");}
    {Do}                    {System.out.println("<Do>");}
    {Loop}                  {System.out.println("<Loop>");}
    {End}                   {System.out.println("<End>");}
    {Next}                  {System.out.println("<Next>");}
    {Step}                  {System.out.println("<Step>");}
    {Continue}              {System.out.println("<Continue>");}
    {To}                    {System.out.println("<To>");}
    {Until}                 {System.out.println("<Until>");}
    {Or}                    {System.out.println("<Or>");}
    {And}                   {System.out.println("<And>");}
    {Not}                   {System.out.println("<Not>");}
    {Mod}                   {System.out.println("<Mod>");}
    {Function}              {System.out.println("<Function>");}
    {Sub}                   {System.out.println("<Sub>");}
    {Dim}                   {System.out.println("<Dim>");}
    {As}                    {System.out.println("<As>");}
    {True}                  {System.out.println("<True>");}
    {False}                 {System.out.println("<False>");}
    {If}                    {System.out.println("<If>");}
    {Else}                  {System.out.println("<Else>");}
    {Then}                  {System.out.println("<Then>");}
    {Structure}             {System.out.println("<Structure>");}
    {Return}                {System.out.println("<Return>");}
    {Console}               {System.out.println("<Console>");}
    {WriteLine}             {System.out.println("<WriteLine>");}
    {ReadLine}              {System.out.println("<ReadLine>");}
    {Identifier}            {System.out.println("<Identifier, '" + yytext() + "'>");}
    {DivMult}               {System.out.println("<Operator, " + yytext() + ">");}
    {AddSub}                {System.out.println("<Operator, " + yytext() + ">");}
    {ConcatOperator}        {System.out.println("<Concat Operator>");}
    {RelationalOperators}   {System.out.println("<Rlational Operator, " + yytext() + ">");}
    {EqualOperator}         {System.out.println("<Equal Operator>");}
    {Point}                 {System.out.println("<Point>");}
    {LeftParenthesis}       {System.out.println("<Left Parenthesis>");}
    {RightParenthesis}      {System.out.println("<Right Parenthesis>");}
    {LefttBrace}            {System.out.println("<Left Brace>");}
    {RightBrace}            {System.out.println("<Right Brace>");} 
    {LeftSquareBracket}     {System.out.println("<Left Square Bracket>");}
    {RigthSquareBracket}    {System.out.println("<Right Square Bracket>");}
    {LineBreak}             {System.out.println("<Enter>");}
    {Number}                {System.out.println("<Number>");}
    {QuotationMark}         {System.out.print("<String literal, "); yybegin(STRING_LITERAl);}
    .                       {System.out.println("Error, unrecognized character: " + yytext());}
}

<COMMENT> {
    {LineBreak} {yybegin(YYINITAL());}
    .           {}
}

<STRING_LITERAl> {
    {QuotationMark} {
                        System.out.println(buffer + ">"); yybegin(STRING_LITERAl);
                        buffer = "";
                        yybegin(YYINITAL());
                    }
    .               { buffer = buffer + yytext();}
}
