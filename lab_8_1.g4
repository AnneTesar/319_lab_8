
// 2. lexer rule name is in capitals (if starts in lowercase, it is
//    considered to be parser rule.

lexer grammar lab_8_1; 

TAG: '<'TAG_TEXT'>'{System.out.println("matching rule:" + getText());};

fragment OPEN: '<';
fragment CLOSE: '>';

TAG_TEXT: EMAIL | DATE | PHONE | CREDITCARD | ADDRESS; 
TEXT: [a-zA-Z0-9-./]+;

fragment EMAIL: 'EMAIL>' TEXT_EMAIL '</EMAIL';
fragment DATE: 'DATE>' TEXT_DATE '</DATE';
fragment PHONE: 'PHONE>' TEXT_PHONE '</PHONE';
fragment CREDITCARD: 'CREDITCARD>' TEXT_CREDITCARD '</CREDITCARD';
fragment ADDRESS: 'ADDRESS>' TEXT '</ADDRESS';

TEXT_EMAIL: SPECIAL_CHAR_A+ SPECIAL_CHAR_B+ '@' SPECIAL_CHAR_A+ SPECIAL_CHAR_B+;
SPECIAL_CHAR_A: 'a-z' | 'A-Z' | '0-9' | '-' | '_' | '~' | '!' | '$' | '&' | '\'' | '(' | ')' | '*' | '+' | ',' | ';' | '='| ':';
SPECIAL_CHAR_B: 'a-z' | 'A-Z' | '0-9' | '-' | '_' | '~' | '!' | '$' | '&' | '\'' | '(' | ')' | '*' | '+' | ',' | ';' | '='| ':' | ".";
//. is okay, as long as it's not first or twice in a row
//added a period but idk how to limit it to only once

TEXT_DATE: NUM NUM? '/' NUM NUM? '/' NUM NUM NUM NUM;
NUM: [0-9];
//need to limit stuff

TEXT_PHONE: PHONE_SPACES | PHONE_DOTS | PHONE_DASH | PHONE_PAREN;
PHONE_SPACES: NUM NUM NUM ' ' NUM NUM NUM ' ' NUM NUM NUM NUM;
PHONE_DOTS: NUM NUM NUM '.' NUM NUM NUM '.' NUM NUM NUM NUM;
PHONE_DASH: NUM NUM NUM '-' NUM NUM NUM '-' NUM NUM NUM NUM;
PHONE_PAREN: '(' NUM NUM NUM ')' NUM NUM NUM '-' NUM NUM NUM NUM;

TEXT_CREDITCARD: VISA | MASTERCARD | AMEX | DINERS | DISCOVER | JCB;
VISA: '4' NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM (NUM NUM NUM)?;
MASTERCARD: '5' [1-5] NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM;
AMEX: '3' ('4' | '7') NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM NUM ; 
DINERS: ([300-305] | '36'NUM | '38'NUM) ;
DISCOVER: TEXT;
JCB: TEXT;

TEXT_ADDRESS: ('A-Z' | 'a-z' | '0-9' | SPECIAL_CHAR | ' ')+;


WS: [ \r\t\n]+ {System.out.println("matching WS rule");skip();};

