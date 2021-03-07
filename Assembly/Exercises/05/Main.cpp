#include <stdio.h>
#include <stdlib.h>
#include <iostream>

// define std como padrão para nao precisar colocar std:: na frente dos comandos
using namespace std;

int main(void){

        int value = 1000;

        while(value <= 1999)
        {
                if(value % 11 == 5)
                {
                        cout << value << " % 11 = 5" << endl;

                } // end if
        
        value++;

        } // End While

        
        return 0;

} // End Main
