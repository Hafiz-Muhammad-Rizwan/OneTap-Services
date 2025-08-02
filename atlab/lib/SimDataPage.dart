
import 'package:flutter/material.dart';
import 'package:atlab/Web%20view.dart';

class SimData extends StatefulWidget {
  const SimData({super.key});

  @override
  State<SimData> createState() => _SimDataState();
}

class _SimDataState extends State<SimData> {
  @override

  Future<void>LaunchLink(String Link)async
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WebView(Ur: Link)));

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sim Data",style: TextStyle(fontSize: 30,color: Colors.white),),
        leading:IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,),
        ),
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration:BoxDecoration(
         color: Colors.white
        ) ,
        child: Column(
          children: [

            SizedBox(height: 20,),
            _makeContainer('https://livetrackeresim.com/','Sim DataBase No.1','Asset/Images/Sim1.jpg',Colors.black),
            SizedBox(height: 20,),
            _makeContainer('https://cnic.sims.pk/', 'Register Sim on CNIC','Asset/Images/Sim2.png',Colors.black)

          ],
        ),
      ),
    );
  }
  Widget _makeContainer(String Launch_Link,String Title,String ImagePath,Color BorderColor)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12),
      child: GestureDetector(
        onTap: ()
        {
          LaunchLink(Launch_Link);
        },
        child: Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
                border: Border(
                  top: BorderSide(color: BorderColor, width: 2),
                  right: BorderSide(color: BorderColor, width: 2),
                  bottom: BorderSide(color: BorderColor, width: 2),
                  left: BorderSide(color: BorderColor, ),
                )
            ),
            child:Row(
              children: [
                Container(
                  height: 90,
                  width: 13,
                  decoration: BoxDecoration(
                      color: BorderColor,
                      borderRadius: BorderRadius.circular(11)
                  ),

                ),
                SizedBox(width: 20,),
                Text(Title,style: TextStyle(fontSize: 20,color: BorderColor,fontWeight: FontWeight.bold),),
                Spacer(),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(
                        image: AssetImage(ImagePath),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                SizedBox(width: 5,)
              ],
            )
        ),
      ),
    );
  }

}
