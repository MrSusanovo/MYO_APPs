#include <stdio.h>
#include <stdlib.h>
static int a[20]={0};
static int *b[20];


static void node_union(int x, int y)
{
    a[x]=a[y];
    *b[x]=*b[y];
    b[x]=b[y];
}
/////////////////////////////////////////////////////////

static void initialize()
{
    for(int i=0;i<20;i++) 
    {
        a[i]=i;
        b[i]=&a[i];
    }
}
//////////////////////////////////////////////////////////

static void print_result()
{
    for(int i=0;i<20;i++) printf("%d ",a[i]);
    printf("\nprint completed!\n");
}


static void is_connected(int x, int y)
{
    if(b[x]==b[y] || *b[x]==*b[y])
    {
        printf("connected!\n");
    }
    else printf("not connected!\n");
}
/////////////////////////////////////////////////////////

static void interpreter(int s)
{
    if(s==1) initialize();
    else if(s==2)
    {
        int x=0;
        int y=0;
        printf("union command,please enter x\n");
        scanf("%d",&x);
        printf("union command,please enter y\n");
        scanf("%d",&y);
        node_union(x,y);
        printf("union completed\n");
    }
    else if(s==3) print_result();
    else if(s==4)
    {
        int x=0;
        int y=0;
        printf("connection command,please enter x\n");
        scanf("%d",&x);
        printf("connection command,please enter y\n");
        scanf("%d",&y);
        is_connected(x,y);
    }
    else if(s==6)
    {
    printf("program started! please enter your command");
    printf("\n 1: Initialize \n 2: Union \n 3: Print \n 4: connection");
    printf("\n EOF: eixt \n 6 print this again \n");
    }
}
/////////////////////////////////////////////////////////////////////

int main()
{
    int s=0;
    int j=0;
    printf("program started! please enter your command");
    printf("\n 1: Initialize \n 2: Union \n 3: Print \n 4: connection");
    printf("\n EOF: eixt \n 6 print this again \n");
    while(1)
    {
        j=scanf("%d",&s);
        if(j!=1) break;
        else
        {
            interpreter(s);
            s=0;
        }
    }
    return 0;
}