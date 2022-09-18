#include <iostream>

using namespace std;


/*int main(){
    int numero_1, numero_2;
    cout<< "Ingrese dos números por favor"<<endl;
    cin>>numero_1;
    cin>>numero_2;
    int suma = numero_1 + numero_2;
    cout<< "El resultado de la suma es "<<suma<<endl;
    return 0;
}*/

int main(){

    /*string nombre;
    cout<<"Ingrese su nombre por favor"<<endl;
    cin>>nombre;
    cout<<"El nombre ingresado es "<<nombre<<endl;*/

    int numero;
    cout<< "Ingrese un numero por favor"<<endl;
    cin>>numero;
    if(numero > 0){
        cout<<"El numero "<< numero<< " es mayor a 0"<< endl;
    }else{
        cout<<"El numero "<< numero<< " es menor a 0"<< endl;
    }
    return 0;
}


