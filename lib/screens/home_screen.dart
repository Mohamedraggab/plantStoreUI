import 'package:flutter/material.dart';
import 'package:plant_app_ui/screens/plant_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> recommended = [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.png',
      'assets/images/4.png',
      'assets/images/5.png',
    ] ;
    List<String> featured = [
      'assets/images/6.jpg',
      'assets/images/7.jpg',
      'assets/images/8.jpg',
      'assets/images/9.webp',
      'assets/images/10.webp',
    ] ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
        elevation: 0.0,
        leading: const Icon(Icons.menu_outlined),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            greenAreaWithSearchBar(size),
            labelContainer('Recommended'),
            SizedBox(
              height: size.height * 0.3 + 20,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return recommendedItemsContainer(size , recommended[index] , context);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 4,
              ),
            ), /// Recommended Plant items
            labelContainer('Featured Plants'),
            SizedBox(
              height: size.height * 0.29,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return featuredPlantItems(size , featured[index] );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 4,
              ),
            ), /// Featured Plant items

          ],
        ),
      ),
    );
  }

  Widget featuredPlantItems(Size size , String img) {
    return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(img),
                fit: BoxFit.fill,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                  offset: Offset(2, 5),
                  spreadRadius: 1,
                ),
              ],
            ),
            margin:const EdgeInsets.only(left: 15 ,bottom: 10),
            padding:const EdgeInsets.only( bottom: 15),
            width: size.width * 0.7 ,
            height: size.height * 0.25 ,
          );
  }

  Widget recommendedItemsContainer(Size size , String img ,context ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const PlantScreen(),)
        );
      },
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.45,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              offset: const Offset(10, 10),
              blurRadius: 11,
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadowColor: Colors.green,
          elevation: 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(img),
                      fit: BoxFit.cover
                    )),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('SAMANTHA',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis),
                          Text(
                            '400\$',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('RUSSIA',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget greenAreaWithSearchBar(Size size) {
    return SizedBox(
      height: size.height * 0.12,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.12 - 27,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.shade800,
              borderRadius:const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: const Text(
              'UI Plant Store',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 54,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.green.withOpacity(0.27),
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget labelContainer(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          MaterialButton(
            onPressed: () {},
            elevation: 0.0,
            color: Colors.green.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            height: 30,
            minWidth: 40,
            child: const Text(
              'More',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
