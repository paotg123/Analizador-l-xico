%{
    #include <stdio.h>
%}

DIGIT   [0-9]
ID  [a-zA-Z_][a-zA-Z0-9]*

%%

"//".*  {printf("COMMENT");}
f  {printf("floatdcl");}
i  {printf("intdlc");}
p  {printf("print");}
{ID}  {printf("id");}
=  {printf("assign");}
\+  {printf("plus");}
{DIGIT}+    {printf("inum");}
{DIGIT}+"."{DIGIT}*    {printf("inum");}

%%

int main(int argc,char *argv[]){
    ++argv,--argc;
    if (argc > 0)
            yyin=fopen(argv[0],"r");
    else
            yyin = stdin;
    
    yylex();
}
