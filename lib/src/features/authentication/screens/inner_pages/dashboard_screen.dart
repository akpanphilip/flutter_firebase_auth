// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> items = ["All", "Addidas", "Nike", "Soccer Boots", "Others"];

  List<String> categories = [
    "Featured Listings",
    "Addidas",
    "Nike",
    "Soccer Boots",
    "Others"
  ];

  // final shoes = [
  //   {
  //     'id': '0',
  //     'imageUrl': nike_1,
  //     'name': 'AIR MAX BOLT Black',
  //     'price': '\u20AC89.99'
  //   },
  //   {
  //     'id': '1',
  //     'imageUrl': nike_2,
  //     'name': 'AIR MAX BOLT Black',
  //     'price': '\u20AC89.99'
  //   },
  //   {
  //     'id': '3',
  //     'imageUrl': nike_3,
  //     'name': 'AIR MAX BOLT Black',
  //     'price': '\u20AC89.99'
  //   },
  //   {
  //     'id': '4',
  //     'imageUrl': nike_4,
  //     'name': 'AIR MAX BOLT Black',
  //     'price': '\u20AC89.99'
  //   },
  // ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        leading: Icon(Icons.menu_outlined),
        title: Text('Shoe buy'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () => Get.to(() => ProfileScreen()),
                child: Icon(Icons.person_4_outlined)),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shoe\nCollection',
                    style: GoogleFonts.poppins(
                        color: tDarkColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  Image(
                    image: AssetImage(logoImage),
                    height: 50,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                decoration:
                    BoxDecoration(border: Border(left: BorderSide(width: 4))),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search...',
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.5), fontSize: 20),
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     hintText: 'Search...',
                    //   ),
                    // ),
                    Icon(
                      Icons.mic,
                      size: 25,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: items.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 10, 10, 0),
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: current == index
                                              ? Colors.black
                                              : Colors.black45,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            items[index],
                                            style: GoogleFonts.nunito(
                                                color: current == index
                                                    ? Colors.white
                                                    : Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          // custom tab bar end
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Text(categories[current],
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w700))
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  if (current == 0)
                    FeaturedListing()
                  else if (current == 1)
                    AddidasListing()
                  else if (current == 2)
                    NikeListing()
                  else if (current == 3)
                    SoccerBootListing()
                  else
                    OtherListing()
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  SingleChildScrollView OtherListing() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PropertyWidget(
            image: nike_2,
            name: 'AIR MAX BOLT Black',
            price: '\u20AC89.99',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: nike_3,
            name: 'AIR MAX BOLT Black',
            price: '\u20AC89.99',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: nike_4,
            name: 'AIR MAX BOLT Black',
            price: '\u20AC89.99',
          ),
        ],
      ),
    );
  }

  SingleChildScrollView SoccerBootListing() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PropertyWidget(
            image: soccer_1,
            name: 'Umbro',
            price: '\u20AC20.99',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: soccer_2,
            name: 'SPORT Men',
            price: '\u20AC15.25',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: soccer_3,
            name: 'Umbro',
            price: '\u20AC20.99',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: soccer_4,
            name: 'Locate',
            price: '\u20AC17.99',
          ),
        ],
      ),
    );
  }

  SingleChildScrollView NikeListing() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PropertyWidget(
            image: nike_1,
            name: 'Nike Air',
            price: '\u20AC120.25',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: nike_2,
            name: 'Nike Revolution',
            price: '\u20AC89.99',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: nike_4,
            name: 'Flex Experience',
            price: '\u20AC60.00',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: nike_4,
            name: 'Renew Serenity',
            price: '\u20AC50.00',
          ),
        ],
      ),
    );
  }

  SingleChildScrollView AddidasListing() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PropertyWidget(
            image: addidas_1,
            name: 'Sports Performance',
            price: '\u20AC99.99',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: addidas_2,
            name: 'Kids Superstar',
            price: '\u20AC60.99',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: addidas_3,
            name: 'Kids Predator',
            price: '\u20AC99.99',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: addidas_4,
            name: 'Performance Slippers',
            price: '\u20AC75.00',
          ),
        ],
      ),
    );
  }

  SingleChildScrollView FeaturedListing() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PropertyWidget(
            image: nike_2,
            name: 'AIR MAX BOLT Black',
            price: '\u20AC89.99',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: nike_3,
            name: 'AIR MAX BOLT Black',
            price: '\u20AC89.99',
          ),
          SizedBox(width: 10),
          PropertyWidget(
            image: nike_4,
            name: 'AIR MAX BOLT Black',
            price: '\u20AC89.99',
          ),
        ],
      ),
    );
  }
}

class PropertyWidget extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  const PropertyWidget({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 280,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Image(
              image: AssetImage(image),
            )),
            Text(
              name,
              style: GoogleFonts.poppins(
                  color: tDarkColor, fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              'Trending Now',
              style: GoogleFonts.poppins(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              price,
              style: GoogleFonts.poppins(
                  color: tDarkColor, fontSize: 18, fontWeight: FontWeight.w600),
            ),
            // Stack(
            //   children: [
            //     Positioned(
            //       top: 10,
            //       right: 10,
            //       child: Icon(Icons.favorite_outline_rounded),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
