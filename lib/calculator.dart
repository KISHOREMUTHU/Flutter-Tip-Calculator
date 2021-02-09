import 'package:flutter/material.dart';



class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
             var tip_percent = 0;


             int person = 1;
             double total = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body : Container(


          // another method : (top : MediaQuery.of(context).size.height*0.1) , means that it is multiplied with the screen size of different phones
        alignment: Alignment.center,
        color:Colors.black54,
        child : ListView(
          scrollDirection: Axis.vertical,
          padding : EdgeInsets.all(20.0),
          children:<Widget> [
            Container (
              width : 200,
              height : 150,

              decoration : BoxDecoration(
                color:Colors.green.shade100 ,
                borderRadius : BorderRadius.circular(14.0),
                border: Border.all(
                  color : Colors.green,
                ),
              ),
              child : Center(
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Bill With Tip ",
                      style : TextStyle(
                        fontWeight : FontWeight.bold,
                        fontSize : 20.0,
                        color: Colors.grey.shade900,
                      ),),
                    SizedBox(height : 20.0,),
                    Text("\$ ${(totalbill(total, person,tip_percent))}",
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
            SizedBox(height : 20),
            Container (
              width : 200,
              height : 200,

              decoration : BoxDecoration(
                color:Colors.green.shade100 ,
              borderRadius : BorderRadius.circular(14.0),
                border: Border.all(
                  color : Colors.green,
                ),
              ),
              child : Center(
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Per Person ",
                    style : TextStyle(
                      fontWeight : FontWeight.bold,
                      fontSize : 20.0,
                      color: Colors.grey.shade900,
                    ),),
                    SizedBox(height : 20.0,),
                    Text("\$ ${(calculate(total, person,tip_percent))}",
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
            Container (
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
              child: Column(
                children:<Widget> [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal : true,),
                    style : TextStyle(
                      color : Colors.blueAccent.shade700,
                    ),
                    decoration : InputDecoration(
                      prefixText: "Bill Amount  ",
                      prefixIcon : Icon (Icons.attach_money_outlined),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        try {
                          total = double.parse(value);
                        } catch (exception) {
                          total = 0.0;
                          }
                        },);

                    },
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              });
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

                                    color : Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text("$person"),
                          InkWell(
                            onTap : (){
                              setState(() {
                                person ++;
                              });
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
                      Text("Tip",
                        style : TextStyle(
                          fontSize: 20.0,
                          color : Colors.green.shade700,
                        ),
                      ),
                      Text(" \$ " + "${calculateTotalTip(total,person, tip_percent).toStringAsFixed(2)}",
                      style : TextStyle(
                    fontSize : 17.0,
                    fontWeight:  FontWeight.bold,
                    color : Colors.green,
                      ),),
                    ],
                  ),
                  // Slider
                  SizedBox(height: 20.0,),
                  Column (
                    children:<Widget> [
                      Text ("$tip_percent%",
                        style :TextStyle(
                          color: Colors.green,
                          fontSize : 17.0,
                          fontWeight : FontWeight.bold,
                        ),

                      ),

                      Slider (
                        min : 0,
                        max:100,
                        activeColor : Colors.green.shade500,
                        inactiveColor: Colors.grey.shade500,
                        divisions : 100,
                        value : tip_percent.toDouble(),
                        onChanged: (double result){
                          setState(() {
                            tip_percent=result.round();
                          });
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
       calculate(double bill , int splitBy , int tipPercent){
              var totalperperson;
              if(bill<0||bill.toString().isEmpty||bill==null){
                setState((){
                  totalperperson = 0;
                  return totalperperson.toStringAsFixed(2);
                });
              }
              else{
             totalperperson = (calculateTotalTip(bill, splitBy, tipPercent) + bill)/splitBy;
          return totalperperson.toStringAsFixed(2);}
       }

       calculateTotalTip(double bill , int splitBy , int tipPercent ){
           var total =0.0;

            total = (bill * tipPercent) / 100;

              return total;
       }
       totalbill(double bill , int splitBy , int tipPercent){
         var total =0.0;
         total = (bill * tipPercent) / 100;
         var totalperperson;
         if(bill<0||bill.toString().isEmpty||bill==null){
           setState((){
             totalperperson = 0;
           //  return totalperperson.toStringAsFixed(2);
           });
         }
         else {
           totalperperson =
               (calculateTotalTip(bill, splitBy, tipPercent) + bill) / splitBy;
           // return totalperperson.toStringAsFixed(2);}
         }
         return (bill+total).toStringAsFixed(2);


       }
        answer(double total){
              return total.toString();
       }
       reverse (int value){
       return 100 - value;
       }

}


