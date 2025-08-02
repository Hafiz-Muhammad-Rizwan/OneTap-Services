

import 'package:flutter/material.dart';
import 'package:atlab/Web%20view.dart';

class ElectricityBill extends StatefulWidget {
  const ElectricityBill({super.key});

  @override
  State<ElectricityBill> createState() => _ElectricityBillState();
}

class _ElectricityBillState extends State<ElectricityBill> {
  @override
  Future<void>LaunchLink(String Link)async
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WebView(Ur: Link)));

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Electricity Bill",style: TextStyle(fontSize: 30,color: Colors.white),),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              _makeContainer('https://bill.pitc.com.pk/fescobill', "FESCO",'Asset/Images/Fesco2.jpg',Colors.black),
              SizedBox(height: 20,),
              _makeContainer('https://www.lesco.gov.pk:36269/Modules/CustomerBillN/CheckBill.asp', "LESCO",'Asset/Images/Lesco.jpg',Colors.black),
              SizedBox(height: 20,),
              _makeContainer('https://bill.pitc.com.pk/iescobill', "IESCO",'Asset/Images/Iesco.jpg',Colors.black),
              SizedBox(height: 20,),
              _makeContainer('https://www.ke.com.pk/customer-services/know-your-bill/', "K Electric",'Asset/Images/K electric 2.png',Colors.black),
              SizedBox(height: 20,),
              _makeContainer('https://bill.pitc.com.pk/mepcobill', "MEPCO",'Asset/Images/Mepco.jpg',Colors.black),
              SizedBox(height: 20,),
              _makeContainer('https://bill.pitc.com.pk/gepcobill', "GEPCO",'Asset/Images/Gepco.jpg',Colors.black),
              SizedBox(height: 20,),
              _makeContainer('https://bill.pitc.com.pk/pescobill', "PESCO",'Asset/Images/Pesco.jpg',Colors.black),
              SizedBox(height: 20,),
              _makeContainer('https://bill.pitc.com.pk/sepcobill', "SEPCO",'Asset/Images/Sepco.jpg',Colors.black),
              SizedBox(height: 20,),
              _makeContainer('https://bill.pitc.com.pk/qescobill/', "QESCO",'Asset/Images/Qesco.jpg',Colors.black),
              SizedBox(height: 20,),
              _makeContainer('https://bill.pitc.com.pk/hescobill', "HESCO",'Asset/Images/Hesco.jpg',Colors.black),
              SizedBox(height: 20,),
            ],
          ),
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
