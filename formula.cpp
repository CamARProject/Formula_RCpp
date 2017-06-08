#include<stdio.h>

int main()
{
	FILE *formula;
	char func[50];
	
	printf("formula?\n");
	
	scanf("%s",func);
	
	formula= fopen("formula.txt","w");
	
	fprintf(formula,"%s\n",func);
	
	fclose(formula);
	
	return 0;
}