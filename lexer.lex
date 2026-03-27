%{
#include <stdio.h>
%}

%%

"//"[^\n]*                          { printf("COMMENT: %s\n", yytext); }
"/*"([^*]|\*+[^*/])*\*+"/"         { printf("COMMENT: %s\n", yytext); }

\"([^\"\\]|\\.)*\"                  { printf("STRING: %s\n", yytext); }
\'([^\'\\]|\\.)*\'                  { printf("STRING: %s\n", yytext); }

[0-9]+\.[0-9]+([eE][+-]?[0-9]+)?   { printf("FLOAT: %s\n", yytext); }
[0-9]+                              { printf("INTEGER: %s\n", yytext); }

"if"|"else"|"while"|"for"|"return"  { printf("KEYWORD: %s\n", yytext); }
"int"|"float"|"char"|"bool"|"void"  { printf("KEYWORD: %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*             { printf("IDENTIFIER: %s\n", yytext); }

[+\-*/=<>!&|]+                      { printf("OPERATOR: %s\n", yytext); }
[;,(){}\[\]]                        { printf("PUNCTUATION: %s\n", yytext); }

[ \t\n]+                            { /* skip whitespace */ }
.                                   { printf("UNKNOWN: %s\n", yytext); }

%%

int yywrap() { return 1; }

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *f = fopen(argv[1], "r");
        if (!f) { perror("Cannot open file"); return 1; }
        yyin = f;
    }
    yylex();
    return 0;
}