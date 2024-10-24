import 'package:flutter/material.dart';
import 'package:flutter_pos_new/component/form/finance.dart';
import 'package:flutter_pos_new/component/form/report.dart';
import 'package:flutter_pos_new/component/pos/pos_test.dart';
import 'package:flutter_pos_new/component/pos/pos_tran.dart';
import 'package:flutter_pos_new/main.dart';
import 'package:get_storage/get_storage.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

 
  
  final box=GetStorage();
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    return WillPopScope(onWillPop: () async=>false
    ,
    child: 
    
    
     Scaffold(
       appBar:  
           AppBar(title: const Text('Main Menu'),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
       toolbarHeight: screenHeight*0.1,
       flexibleSpace: Stack(
       children: [
        
            Image.asset("assets/images/appbar.png",
            fit: BoxFit.fill,
            //height: screenHeight*0.1,
            height: screenHeight * 0.3,
            ),
       ],
       ),
      
      ),
      
     floatingActionButton: FloatingActionButton(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Log OUT',style: TextStyle(fontSize: 12),)
        ],
      ),
      onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => const MainApp()));
     },
     
     ),


      
      body: 
      Container(
        
           height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/back2.jpg'),fit: BoxFit.cover)
        ),
        child: 
      
      SingleChildScrollView(
        child: Container(
       
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                margin: const EdgeInsets.all(5),
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  
                  color: Colors.grey,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20)  
                  ),
                  border: Border.all(style: BorderStyle.solid,color: Colors.grey,width: 2)
                ),
                child: Text('User Name: '+box.read('username'),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),

              //Menu Placement
       
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //menu master
                      Text_Title('Master Menu'),
                       const SizedBox(height: 10,), 
                      Row(
                        children: [      
                            Menu_Detail('shopprofile.gif', 'Shop Profile'),
                            const SizedBox(width: 8,),
                            Menu_Detail('menu11.gif', 'Item Master')
                        ],
                      ),

                       //menu master
                       const SizedBox(height: 15,), 
                       Text_Title('Transaction'),
                       const SizedBox(height: 10,), 
                      Row(
                        children: [      
                            GestureDetector(child: 
                            Menu_Detail('menupos.gif', 'POS'),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder:  (context) => const Pos_Tran(),));
                            },
                            ),
                            const SizedBox(width: 8,),
                            Menu_Detail('menugr.gif', 'Good Receive'),
                             const SizedBox(width: 8,),
                            Menu_Detail('menutransfer.gif', 'Transfer Stock'),
                             const SizedBox(width: 8,),
                            Menu_Detail('menustockname.gif', 'Stock Opname'),
                                const SizedBox(width: 8,),
                            Menu_Detail('menuadjust.gif', 'Ajustment'),
                        ],
                      )
                      
                  ],
                ),
              )
            ],
          ),
        )
      ),
    )
     )
    );
  }

 Widget Text_Title(String ttl) {
 return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(7)
      ),

      child: Text(
        ttl,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 12),
      ),
    );
  }

  Widget Menu_Detail(String pict,String ttl){
    return Container(
   child: Column(
 
    children: [
        Container(
          height: 50,
          width: 50,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage('assets/images/$pict'),fit: BoxFit.fill),
             borderRadius: BorderRadius.circular(20),
             border: Border.all(style: BorderStyle.solid,color: Colors.grey)
          ),
         // child: Image.asset('assets/images/menu11.gif'),
        ),
        const SizedBox(height: 5,),  
        Text(ttl,style: const TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
    ],
   ),
    );
  }
}