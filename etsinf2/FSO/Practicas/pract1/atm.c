
#include <stdio.h>

#define InitBalance 1000
float Balance;

int main() { 
    int operation, pin;
    float income, withdraw = 0;
  
    printf("\nWelcome to the FSO ATM\n");
    Balance = InitBalance;
    operation = 0;
    printf("\nIndicate operation to do:\n");
    printf(" 1.Cash Income\n 2.Cash Withdrawal\n 3.Balance Enquiry\n");
    printf(" 4.Account Activity\n 5.Change PIN\n 6.Exit\n\n");
    printf(" Operation:");
    scanf("%d", &operation); 
 
    if (operation == 1) {
        printf(" Cash Income\n");
        printf("\n Enter the amount to deposit:");   
        scanf("%f",&income);
        Balance = Balance+income;  
        withdraw += income;
        printf(" Successful income\n");
        
    } else if (operation == 2) {
        printf(" Cash Withdrawal\n");
        printf("\n Enter the amount to withdraw:");
        scanf("%f", &income);
        
        if (Balance > income) {
            Balance = Balance - income;
            withdraw += income;
        } else {
            printf(" Operation does not allowed\n");
            printf("   Not enough cash\n");
        }
        
    } else if (operation == 3) {
        printf(" Balance Enquiry\n");
        
    } else if (operation == 4){
        printf(" Initial balance: %d Euros\n", InitBalance);
        printf("        Withdraw: %.2f Euros\n", withdraw);
        
    } else if (operation == 5) {
        printf(" Introduzca nuevo PIN: ");
        scanf("%d",&pin);

    } else if (operation == 6) {
        printf(" EXIT\n"); 
        
    } else if (operation > 6) {
        printf(" ERROR: This opertaion does not applied\n");
    }
    
    printf("\n\n Current Balance: %.2f Euros", Balance);
    printf("\n\n Thanks \n\n");
    return(0);
    
}
