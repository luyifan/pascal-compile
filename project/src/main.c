#include "global.h"
#include "util.h"
#include "scan.h"
#include "parse.h"
#include"analyze.h"
#include"CodeGenerater.h"

char filename[30] = "system_test.p";
FILE * source ;
FILE * listing ;
int TraceScan = True;
int lineno=0;
int yywrap (void);
void print_help(void);
int main(int argc, char **argv){
	TreeNode* syntaxTree;
	char* outputfile; 
	if(argc <2){
		print_help();
		exit(1);
	}
    source = fopen(argv[1],"r");
    listing = fopen("tmp.list", "w+");
	if(argc == 3){
		InitialGenerater(argv[2]);
	}
	else{
		InitialGenerater("out.asm");
	}
   
    syntaxTree = parse();
  //  printTree(syntaxTree);
    printf("Begin Coding: \n");
    BuildCode(syntaxTree);
//    printf("The SymTab is :\n");
//    printSymTab();
	printf("End Coding: \n");
    return 0;

}

int yywrap (void ){
	return 1;
}
void print_help(void){
	printf("The Usage:\n");
	printf("compiler pascal_source_filename [assemble_filename]\n");
}