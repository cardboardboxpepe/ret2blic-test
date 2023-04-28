#include <stdlib.h>
#include <stdio.h>

void vuln()
{
  char arr[0x10];
  scanf("%s", arr);
  printf("Input: %s",arr);
}

int main()
{
  vuln();
  return 0;
}

