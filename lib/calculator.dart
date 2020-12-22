import 'package:flutter/material.dart';


// Stateful widget for creating the app 

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
             int tip_percent = 0;  // Assigning tip-percent , person-counter and total bill amount variables 
             int person = 1;
             double total = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // Appbar Editing
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
            "Tip Calculator",
            style : TextStyle(
            fontFamily: 'Lobster',
                             ),
                  ),
       centerTitle: true,

      ),
      
      // Body of the app 
      
      body : Container(

      // another method : (top : MediaQuery.of(context).size.height*0.1) , means that it is multiplied with the screen size of different phones
        
        alignment: Alignment.center, // Aligning the container at center
        color:Colors.black54, // Black background
        
        // Listview widget for see all widgets in the form of a list 
        child : ListView(
           scrollDirection: Axis.vertical,
           padding : EdgeInsets.all(20.0), // padding keyword
          
           // Inside listview , all the widgets are placed under children 
           children:<Widget> [
                Container (
                   width : 200,
                   height : 200,
                    
                   // BoxDecoration is used for adding decorations to a container
                   decoration : BoxDecoration(
                        color:Colors.green.shade100 ,
                        borderRadius : BorderRadius.circular(14.0),  // Asssigning border Radius to be circular
                       // border decoration keyword
                        border: Border.all(
                            color : Colors.green,
                                          ),
                                             ),
              
              // Enclosing the text and total per head value in center widget 
              child : Center(
                  
                //Creating a column widget for displaying the total per head 
                  child: Column (
                    
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                               Text(
                                 "Total Per Person ",
                                 style : TextStyle(
                                         fontWeight : FontWeight.bold,
                                         fontSize : 20.0,
                                         color: Colors.grey.shade900,
                                                  ),
                                  ),
                         
                               SizedBox(height : 20.0,),  // Providing a sizedbox for obtaining a sufficient distance 
                         
                               Text( 
                                 "\$ ${(calculate(total, person,tip_percent))}",
                                 style : TextStyle(
                                         fontWeight : FontWeight.bold,
                                         fontSize : 45.0,
                                        color: Colors.grey.shade900,
                                                  ),
                                   ),
                                         ],
                              ),
                
                         ),

        ),
             
            // Creating a new container
            Container (
              
                     // Giving a good margin , padding , decoration to the container 
                     margin : EdgeInsets.only (top : 20.0),
                     padding : EdgeInsets.all(12.0),
                     decoration : BoxDecoration(
                     color : Colors.green.shade100,
                     border : Border.all(
                              color : Colors.green,
                              style : BorderStyle.solid,
                                        ),
                     borderRadius: BorderRadius.circular(14.0),
                                               ),
              // Creating a column widget 
              
              child: Column(
                    
                   // enclosing all the features inside the children 
                   children:<Widget> [
                                // creating a textfield
                                TextField(
                                       keyboardType: TextInputType.numberWithOptions(decimal : true,), // creating a keypad with numbers with decimal is true 
                                       style : TextStyle(
                                               color : Colors.blueAccent.shade700,
                                                        ),
                                  
                                       // Giving decoration to the keypad input
                                       decoration : InputDecoration(                              
                                                    prefixText: "Bill Amount  ",
                                                    prefixIcon : Icon (Icons.attach_money_outlined),
                                                                   ),
                                  
                                       onChanged: (String value) {
                                                  setState(() {
                                                           try {
                                                                total = double.parse(value);
                                                               }
                                                           catch (exception) {
                                                                total = 0.0;
                                                                             }
                                                              
                                                              });
                                                                  },
                                          ),
                     
                                 Row (
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  // assigning the main axis alignment to be a space between inorder to give some sufficient space 
                                          children:<Widget>[
                                            
                                                     Text (
                                                            "Split" ,
                                                            style : TextStyle(
                                                            fontSize : 20.0,
                                                            color : Colors.green.shade700,
                                                                             ),
                                                          ),
                                            
                                                     Row (
                                                           children:<Widget> [
                                                             
                                                                  InkWell(
                                                                    
                                                                     onTap : (){
                                                                          setState(() {
                                                                                 if ( person>1){
                                                                                         person --;
                                                                                               }
                                                                                      },
                                                                                  );
                                                                               },
                                                                    
                                                                     child : Container (
                                                                          width : 40,
                                                                          height : 40 ,
                                                                          margin : EdgeInsets.all(14.0),
                                                                          decoration: BoxDecoration(
                                                                                      color : Colors.green.shade500,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                    ),
                                                                          child: Center(
                                                                                 child: Text(
                                                                                          "-",
                                                                                          style : TextStyle(
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontSize: 20.0,                                   
                                                                                                  color : Colors.white,
                                                                                                            ),
                                                                                             ),
                                                                                        ),
                                                                                         ),
                                                                                ),
                                                             
                                                                Text("$person"), // Print the person counter
                                                             
                                                                InkWell(
                                                                  
                                                                    onTap : (){
                                                                            setState(() {
                                                                                       person ++;
                                                                                        }
                                                                                    );
                                                                              },
                                                                  
                                                                   child : Container (
                                                                            width : 40,
                                                                            height : 40 ,
                                                                            margin : EdgeInsets.all(14.0),
                                                                            decoration: BoxDecoration(
                                                                                        color : Colors.green.shade500,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                     ),
                                                                     
                                                                            child: Center(
                                                                                   child: Text(
                                                                                           "+",
                                                                                           style : TextStyle(
                                                                                                     color : Colors.white,
                                                                                                     fontWeight: FontWeight.bold,
                                                                                                     fontSize: 20.0,
                                                                                                            ),
                                                                                              ),
                                                                                         ),
                                                                                      ),
                                                                        ),

                                                          ],
                      ),

                    ],
                  ),
                     
                         Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        
                                                Text(
                                                       "Tip",
                                                       style : TextStyle(
                                                               fontSize: 20.0,
                                                               color : Colors.green.shade700,
                                                                        ),
                                                    ),
                                        
                                                Text(
                                                       " \$ " + "${calculateTotalTip(total,person, tip_percent).toStringAsFixed(2)}",
                                                       style : TextStyle(
                                                               fontSize : 17.0,
                                                               fontWeight:  FontWeight.bold,
                                                               color : Colors.green,
                                                                        ),
                                                    ),
                                                          ],
                            ),
                  
                  SizedBox(height: 20.0,),  
                     
                  Column (
                    
                             children:<Widget> [
                                              Text (
                                                      "$tip_percent%",
                                                       style :TextStyle(
                                                              color: Colors.green,
                                                              fontSize : 17.0,
                                                              fontWeight : FontWeight.bold,
                                                                       ),

                                                   ),
                               
                                              // Creating a slider to set the tip percent         
                                              Slider (
                                                       // Setting all the parameters of a slider 
                                                       min : 0,
                                                       max:100,
                                                       activeColor : Colors.green.shade500,
                                                       inactiveColor: Colors.grey.shade500,
                                                       divisions : 10,
                                                       value : tip_percent.toDouble(), // Slider always require a double value . So ,convert tip percent value to double
                                                       onChanged: (double result){
                                                                  setState(() {
                                                                            tip_percent=result.round();
                                                                              }
                                                                          );
                                                                                 },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
       // function to calculate total bill per person
       calculate(double bill , int splitBy , int tipPercent){
         
                       var totalperperson;
                       if(bill<0||bill.toString().isEmpty||bill==null){
                                        return 0;
                                                                      }
                       else{
                                       totalperperson = (calculateTotalTip(bill, splitBy, tipPercent) + bill)/splitBy;
                                       return totalperperson.toStringAsFixed(2);
                           }
         
                                                            }
  
        // function to calculate tip value
       calculateTotalTip(double bill , int splitBy , int tipPercent ){
         
                       var total =0.0;
                       total = (bill * tipPercent) / 100;
                       return total;
         
                                                                      }

        answer(double total){
              return total.toString();
                            }

}


