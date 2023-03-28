#include<stdio.h>

void dummy_func()
{
    printf("This is a dummy function.");
}
  
void memory_check()
{
    printf("This is a sample memory check");
}

  
int main(void)
{
    char *address;
    int main_add=memory_check;
    printf("Enter the address of function memory_check in hex :");
    scanf("%s", address);
    char *b = address + 2;
    int num = (int)strtol(b, NULL, 16);
    if(main_add==num){
        printf("\n You have found the address successfully!!!\n\n");
    }
    printf("Next Step is to attack the heapoverflow_vulnerability");
    return 0;
}