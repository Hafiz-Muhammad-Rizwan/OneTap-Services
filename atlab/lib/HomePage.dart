import 'package:atlab/Driving%20License.dart';
import 'package:atlab/Electricity.dart';
import 'package:atlab/FBR.dart';
import 'package:atlab/OnlineFir.dart';
import 'package:atlab/Passport.dart';
import 'package:atlab/Ptcl.dart';
import 'package:atlab/SUIGAS.dart';
import 'package:atlab/SimDataPage.dart';
import 'package:atlab/TrackingParsel.dart';
import 'package:atlab/VehicleVerification.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState()
  {
    super.initState();
  }
  Future<void>LaunchLink(String Link)async
  {
    final LinkUri=Uri.parse(Link);
    await launchUrl(LinkUri);

  }
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("ATL LAB",style: TextStyle(fontSize: 30,color: Colors.white),),

          actions: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Asset/Images/Back Ground Images.jpg"),
                  fit: BoxFit.cover
                )
              ),
              child: PopupMenuTheme(
                data: PopupMenuThemeData(
                 color:Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)
                  ),
                ),
                child: PopupMenuButton<String>(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                  onSelected: (String value) {
                    // This method will be called when an item is selected
                     if (value == 'Rating') {
                      LaunchLink('https://www.adeebtechlab.com/');
                    } else if (value == 'About') {
                     LaunchLink('https://www.adeebtechlab.com/');
                    } else if (value == 'ContactWhatsApp') {
                     LaunchLink('https://www.whatsapp.com/channel/0029VaCeeBg4inos1Eqtbc43');
                    }else if (value=='LinkedIN')
                      {
                        LaunchLink('https://www.linkedin.com/company/adeebtechnologylab/');
                      }
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'Rating',
                      child: ListTile(
                        leading: Icon(Icons.star_rate,color: Colors.black,size: 25,),
                        title: Text("Rating",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'About',
                      child: ListTile(
                        leading: Icon(Icons.info,color: Colors.black,size: 25,),
                        title: Text("About",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'ContactWhatsApp',
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.whatsapp),
                        title: Text("Contact Whats App",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'LinkedIN',
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.linkedin),
                        title: Text("Contact Linked In",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]

      ),
      body:SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                _makeContainer("Asset/Images/Sim.jpg","SIM DATA",SimData(),Colors.black),
                SizedBox(height: 20,),
                _makeContainer("Asset/Images/Driving Licese.png" ,"Driving License",DrivingLicense(),Colors.black),
                SizedBox(height: 20,),
                _makeContainer("Asset/Images/Police3.png","Online FIR",OnlineFire(),Colors.black),
                SizedBox(height: 20,),
                _makeContainer("Asset/Images/Tax.png.jpg","NTN Inquiry",CheckFBR(),Colors.black),
                SizedBox(height: 20,),
                _makeContainer("Asset/Images/Vehicle.png.png","Vehicle Verification",CheckVehicleverification(),Colors.black),
                SizedBox(height: 20,),
                _makeContainer("Asset/Images/Passport 2.jpg","Passport Inquiry",CheckPassport(),Colors.black),
                SizedBox(height: 20,),
                _makeContainer("Asset/Images/ElectricPng.png","Electricity Bill",ElectricityBill(),Colors.black),
                SizedBox(height: 20,),
                _makeContainer("Asset/Images/Suigas.png.png","Sui Gas Bill",SuigasBill(),Colors.black),
                SizedBox(height: 20,),
                _makeContainer("Asset/Images/Internet2.jpg","PTCL",PtclBill(),Colors.black),
                SizedBox(height: 20,),
                _makeContainer("Asset/Images/Track.png.jpg","Package Tracking",CheckTrackingparsel(),Colors.black),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
  Widget _makeContainer(String ImagePath,String ImageTitle,Widget TargetPage,Color BorderColor)
  {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TargetPage));
      },
     child: SizedBox(
       height: 250,
       width:double.infinity,
       child: Card(
         elevation: 10,
         shadowColor: Colors.white,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(18)
         ),
         clipBehavior: Clip.antiAlias,
         child: Column(
           children: [
             Container(
               height: 200,
               width: double.infinity,
               decoration: BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage(ImagePath),
                   fit: BoxFit.cover
                 )
               ),
             ),
             Expanded(
               child: Container(
                 width: double.infinity,
                 color: Colors.black,
                   child:Text(ImageTitle,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)
               ),
             )
           ],
         ),
       ),
     ),
    );
  }
}
