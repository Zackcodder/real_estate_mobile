import 'package:flutter/material.dart';
import 'package:real_estate_mobile/widgets/mapWidget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  IconData _currentIcon = Icons.layers_sharp;
  final List<Map<String, dynamic>> iconList = [
    {'text': 'Cosy areas', 'icon': Icons.shield_moon_sharp},
    {'text': 'Price', 'icon': Icons.wallet},
    {'text': 'Infastruture', 'icon': Icons.shopping_basket},
    {'text': 'Without any layer', 'icon': Icons.layers_sharp},
    // Add more items here
  ];
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: iconList.map((item) {
            return ListTile(
              leading: Icon(item['icon']),
              title: Text(item['text']),
              onTap: () {
                setState(() {
                  _currentIcon = item['icon'];
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MapViewScreen(),

        ///search box
        Positioned(
          top: 40,
          right: 23,
          left: 23,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.only(
                  right: 20,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black),
                ),
                width: 200,
                child: TextField(
                  textAlign: TextAlign.start,
                  onChanged: ((value) {}),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 2),
                    hintText: 'Saint PertersBurg',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    // prefixIcon:Icon(Icons.menu_outlined, color: kcGrey,size: 24.0,),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20.0,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(45.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Icon(
                  Icons.tune_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              )
            ],
          ),
        ),

        ///botton menu
        Positioned(
          bottom: 90,
          left: 23,
          child: Column(
            children: [
              PopupMenuButton<Map<String, dynamic>>(
                onSelected: (item) {
                  setState(() {
                    _currentIcon = item['icon'];
                  });
                },
                itemBuilder: (context) {
                  return iconList.map((item) {
                    return PopupMenuItem<Map<String, dynamic>>(
                      value: item,
                      child: Row(
                        children: [
                          Icon(item['icon']),
                          SizedBox(width: 10),
                          Text(item['text']),
                        ],
                      ),
                    );
                  }).toList();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.7),
                  radius: 25,
                  child: Icon(
                    _currentIcon,
                    // Icons.layers_sharp,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              ///location
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.7),
                radius: 25,
                child: const Icon(
                  Icons.near_me,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        ///list of varient
        Positioned(
          bottom: 90,
          right: 23,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.sort,
                  color: Colors.white,
                ),
                Text(
                  'List of varients',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
