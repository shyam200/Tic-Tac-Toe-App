import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

// TODO: LInk Images
AssetImage cross=AssetImage('images/cross.png');
AssetImage circle=AssetImage('images/circle.png');
AssetImage edit=AssetImage('images/edit.png');

bool isCross=true;
String message;
List<String>gameState ;

//TODO: Initializing the state of box with empty
@override
  void initState() {
    super.initState();
  setState(() {
    this.gameState=[
  "Empty",
  "Empty",
  "Empty",
  "Empty",
  "Empty",
  "Empty",
  "Empty",
  "Empty",
  "Empty",
];
this.message="";
  });
 }

resetGame(){
 setState(() {
   this.gameState=[
  "Empty",
  "Empty",
  "Empty",
  "Empty",
  "Empty",
  "Empty",
  "Empty",
  "Empty",
  "Empty",
];

this.message="";  //resetting the message to show nothing
 });
}

//TODO: Get image method

AssetImage getImage(String value){   //not necessary to mention the asset inmage return type type
  switch (value) {
    case ('cross'):
           return this.cross;
      break;
     case ('Empty'):
           return this.edit;
      break;
     case ('circle'):
           return this.circle;
      break;  
  }
}

//TODO: Play game method
PlayGame(int index){

  if(this.gameState[index]=='Empty')
  {
    setState(() {
      if(this.isCross)
        this.gameState[index]="cross";
        //this.isCross=false;          one way of doing
      else
        this.gameState[index]="circle";
        //this.isCross=true;
      this.isCross=!isCross;     // Another way of doing just one line     
      this.checkWin();
    });
  }
}
 
//Delay function to build reset game after the message print
delay(){
Future.delayed(const Duration(milliseconds:2000),() {    // 1 second = 1000 milliseconds
// setState(() {
//    this.resetGame();  
//     });
this.resetGame();
  } 
 );
}


//TODO:CheckWin MEthod
checkWin(){
  if((this.gameState[0]!='Empty')&&(this.gameState[0]==this.gameState[1])&&(this.gameState[1]==this.gameState[2]))
      {
          setState(() {
            message='${this.gameState[0]} Wins';
           // this.delay();   //we can also call here it will also work fine because reset method has setState funtion
          });
          this.delay();
      }
  else if((this.gameState[3]!='Empty')&&(this.gameState[3]==this.gameState[4])&&(this.gameState[4]==this.gameState[5]))
        {
            setState(() {
            message='${this.gameState[3]} Wins';
          });
          this.delay();
        }
  else if((this.gameState[6]!='Empty')&&(this.gameState[6]==this.gameState[7])&&(this.gameState[7]==this.gameState[8]))
        {
            setState(() {
            message='${this.gameState[6]} Wins';
          });
           this.delay();
        }
  else if((this.gameState[0]!='Empty')&&(this.gameState[0]==this.gameState[3])&&(this.gameState[3]==this.gameState[6]))
        {
            setState(() {
            message='${this.gameState[0]} Wins';
          });
             this.delay();
        }
  else if((this.gameState[1]!='Empty')&&(this.gameState[1]==this.gameState[4])&&(this.gameState[4]==this.gameState[7]))
        {
            setState(() {
            message='${this.gameState[1]} Wins';
          });
             this.delay();
        }
  else if((this.gameState[2]!='Empty')&&(this.gameState[2]==this.gameState[5])&&(this.gameState[5]==this.gameState[8]))
        {
            setState(() {
            message='${this.gameState[2]} Wins';
          });
             this.delay();
        }
else if((this.gameState[0]!='Empty')&&(this.gameState[0]==this.gameState[4])&&(this.gameState[4]==this.gameState[8]))
        {
            setState(() {
            message='${this.gameState[0]} Wins';
          });
             this.delay();
        }
else if((this.gameState[2]!='Empty')&&(this.gameState[2]==this.gameState[4])&&(this.gameState[4]==this.gameState[6]))
        {
            setState(() {
            message='${this.gameState[2]} Wins';
          });
             this.delay();
        }
else if(!this.gameState.contains('Empty'))
        {
          setState((){
            this.message='Game Draw';
          });
            this.delay();
        }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 3,
                 childAspectRatio: 1.0,
                 crossAxisSpacing: 20.0,
                 mainAxisSpacing:20.0
              ), 
              itemCount: this.gameState.length,      // or 9
              itemBuilder: (context, i) => SizedBox(
                  height: 100.0,
                  width:  100.0,
                  child: MaterialButton(
                   // color: Colors.yellow,
                    child: Image(
                      image: this.getImage(this.gameState[i]),
                      ),
                    onPressed: (){
                      this.PlayGame(i);
                    },
                  ),
               ),
               
              ),
            ),
          
            Container(
              padding:EdgeInsets.all(20.0),
              child:Text(this.message,  style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
               // height: 10.0
              ),),
            ),

            Container(
              padding: EdgeInsets.all(20.0),
              child: MaterialButton(
                minWidth: 200,
                height: 50,
                color: Colors.teal,
                elevation:30.0,
                splashColor: Colors.tealAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text('Reset Game', style:TextStyle(
                  color: Colors.white,
                 // fontSize: 20.0,
                  //fontWeight: FontWeight.bold,
                  ),
                  ),
                onPressed: this.resetGame,
              ),
            ),
        ],
      ) ,
    );
  }
}