# Lexical Analyzer

A lexical analyzer built using **Flex (`.lex`)** that tokenizes source code and outputs the token type, lexeme, line number, and column number for each token found.

## Features
- Identifies and classifies tokens (keywords, identifiers, operators, literals, etc.)
- Outputs token type, lexeme, line number, and column number
- Handles whitespace and newlines gracefully

## File Structure
```
lexical-analyzer/
├── lexer.lex       # Flex specification file
└── README.md
```

## How to Run
```bash
flex lexer.lex
gcc lex.yy.c -o lexer -lfl
./lexer < input.txt
```

## Sample Output
```
TOKEN: KEYWORD   | LEXEME: int    | LINE: 1 | COL: 1
TOKEN: IDENTIFIER| LEXEME: main   | LINE: 1 | COL: 5
TOKEN: OPERATOR  | LEXEME: =      | LINE: 2 | COL: 10
```

## Language & Tools
- **Language:** Flex (Lex)
- **Tools:** VS Code, GCC
- **Course:** Compiler Design
