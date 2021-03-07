#include <stdio.h>
#include <stdlib.h>
#include <iostream>

// define std como padrão para nao precisar colocar std:: na frente dos comandos
using namespace std;

int main(void){

        int startValue = 0, nextValue = 0;

        while(nextValue < 100)
        {

        nextValue++;

        cout << startValue << " + " << nextValue << " = " << startValue + nextValue << endl;

        startValue += nextValue;


        } // End While

        cout << "Result: " << startValue << endl;
        return 0;

} // End Main
