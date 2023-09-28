import 'package:flutter/material.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.27,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin:const EdgeInsets.only(top: 20, bottom: 70),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        padding:const EdgeInsets.only(top: 15 ,right: 50),
                        child: const Icon(Icons.arrow_back_outlined),
                      ),
                    ),
                    customButton(Icons.brightness_2_outlined),
                    customButton(
                      Icons.grain_sharp
                    ),
                    customButton(
                      Icons.wind_power
                    ),
                    customButton(Icons.bolt),


                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: size.height * 0.77,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        bottomLeft: Radius.circular(70)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        color: Colors.grey,
                        blurRadius: 5,
                        spreadRadius: 2,
                        blurStyle: BlurStyle.normal,
                      )
                    ],
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/images/4.png'),
                        fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding:const EdgeInsets.only(top: 20,bottom: 20 , right: 20 ,left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Angelica',style:  TextStyle(
                        fontSize: 45 ,
                        fontWeight:FontWeight.w700),),
                    SizedBox(height: 10,),
                    Text('RUSSIA',style:  TextStyle(fontSize: 18 , color: Colors.grey),),
                  ],
                ),

                const Text('\$440',style: TextStyle(fontSize: 30 , color: Colors.grey),),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    color : Colors.green.shade800 ,
                    borderRadius:const BorderRadius.only(topRight: Radius.circular(40),),
                  ),
                  child:const Center(
                      child: Text('Buy Now' , textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16 ,
                        fontWeight: FontWeight.w500,
                      ),
                      ),),
                ),
                const Expanded(
                    child: Center(
                      child: Text('Description' ,style: TextStyle(fontSize: 16)),
                    ),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container customButton(IconData icon) {
    return Container(
                    width: 70,
                    height: 70,
                    margin:const EdgeInsets.symmetric(vertical: 25),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0 ,
                          blurRadius: 1 ,
                          offset: Offset(-2, 2),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Icon(icon,
                      color: Colors.red ,
                      size: 40,),
                  );
  }
}
