#include <stdlib.h>
#include <stdio.h>

//int main() {
//	char buffer[60];
//	puts("enter some shit nigga: ");
//	gets(buffer);
//	return 0;
//}

//int main() {
//	system("/bin/sh");
//	return 0;
//}

/* stack-example-shell.c */

void win()
{
  system("/bin/sh");
  exit(0);
}

void vuln()
{
  char arr[0x10];
  //gets(arr);
  scanf("%s", arr);
  fflush(stdin);
  printf("Input: %s",arr);
}

int main()
{
  vuln();
  return 0;
}

