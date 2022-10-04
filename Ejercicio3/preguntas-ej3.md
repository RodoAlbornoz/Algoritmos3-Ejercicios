Preguntas teóricas 

Aporte de los mensajes de DD 

En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados? 

El primer llamado aportaría el qué se quiere hacer, y el segundo dónde se quiere hacerlo. 
En el caso de lo trabajado, un ejemplo sería la suma. El objeto Uno puede recibir el mensaje sumar (+) que es polimórfico y así se establece que operación se va a realizar y luego quien lo envía es el argumento (dos, por ejemplo) y eso determina si la operación en la fracción o en el entero.  

 

Lógica de instanciado 

Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven? 

Seria mejor tener la lógica dentro de la parte de “class” de cada objeto, porque allí se trata con las propiedades de todo objeto que es instancia de esa clase.  
Si se crea el objeto desde diferentes lugares y diferentes formas, se puede hacer que la clase madre lo instancie en su mensaje de inicialización. 
 

Nombres de las categorías de métodos 

Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos? 

Estamos categorizando dependiendo de la función que tienen los mensajes en el dominio de nuestro problema.  
 

Subclass Responsibility 

Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve? 

Ponemos subclassResponsibility en la superclase, porque el mensaje dentro de esta solo define qué hace el mensaje, pero no debe definir cómo lo hace. Esto es responsabilidad de sus clases hijas que tienen la implementación del mensaje en sus distintos casos. SubclassResponsibility ataja el error en caso de que se quiera que la clase madre responda a un mensaje implementado en las clases hijas. 


No rompas 

¿Por qué está mal/qué problemas trae romper encapsulamiento? 

Aumenta el acoplamiento. La relación es cruzada y por eso si se cambia algo, aumenta la complejidad. Es mejor, en caso de saber que dos objetos tienen una relación directa, crear un colaborador interno. 