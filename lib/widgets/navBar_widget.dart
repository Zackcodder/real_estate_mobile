import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_mobile/providers/nav_bar_provider.dart';
import 'package:real_estate_mobile/screen/chat_screen.dart';
import 'package:real_estate_mobile/screen/favorite_screen.dart';
import 'package:real_estate_mobile/screen/home_screen.dart';
import 'package:real_estate_mobile/screen/information_screen.dart';
import 'package:real_estate_mobile/screen/search_screen.dart';

class NarBar extends StatefulWidget {
  const NarBar({super.key});

  @override
  State<NarBar> createState() => _NarBarState();
}

class _NarBarState extends State<NarBar> {
  @override
  void initState() {
    // FlutterNativeSplash.remove();
    super.initState();
  }

  List<Widget> screens = [
    const SearchScreen(),
    const ChatScreen(),
    const HomeScreen(),
    const FavoriteScreen(),
    const InformationScreen(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NavbarProvider navbarProvider = Provider.of<NavbarProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          screens[navbarProvider.currentTab],
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 60,

              ///background deco image
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: const Color.fromARGB(255, 34, 33, 33),
              ),
              child: NavigationBarTheme(
                data: const NavigationBarThemeData(
                  indicatorShape: null,
                  backgroundColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                ),
                child: Center(
                  child: NavigationBar(
                    animationDuration: const Duration(seconds: 2),
                    labelBehavior:
                        NavigationDestinationLabelBehavior.alwaysShow,
                    selectedIndex: navbarProvider.currentTab,
                    onDestinationSelected: (int idx) {
                      Provider.of<NavbarProvider>(context, listen: false)
                          .updateScreen(idx);
                    },
                    destinations: const [
                      ///search
                      NavigationDestination(
                          icon: SizedBox(
                            height: 100,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          selectedIcon: SizedBox(
                            height: 100,
                            child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 50,
                              child: Icon(
                                Icons.search,
                                color: Colors.yellow,
                                size: 20,
                              ),
                            ),
                          ),
                          label: ''),

                      ///msg
                      NavigationDestination(
                          icon: SizedBox(
                            height: 100,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.chat,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          selectedIcon: SizedBox(
                            height: 100,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.orange,
                              child: Icon(
                                Icons.chat,
                                color: Colors.yellow,
                                size: 20,
                              ),
                            ),
                          ),
                          label: ''),

                      ///home
                      NavigationDestination(
                          icon: SizedBox(
                            height: 100,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.home_filled,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          selectedIcon: SizedBox(
                            height: 100,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.orange,
                              child: Icon(
                                Icons.home_filled,
                                color: Colors.yellow,
                                size: 20,
                              ),
                            ),
                          ),
                          label: ''),

                      ///fav
                      NavigationDestination(
                          icon: SizedBox(
                            height: 100,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          selectedIcon: SizedBox(
                            height: 100,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.orange,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.yellow,
                                size: 20,
                              ),
                            ),
                          ),
                          label: ''),

                      ///persone
                      NavigationDestination(
                        icon: SizedBox(
                          height: 100,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        selectedIcon: SizedBox(
                          height: 100,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.orange,
                            child: Icon(
                              Icons.person,
                              color: Colors.yellow,
                              size: 20,
                            ),
                          ),
                        ),
                        label: '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
    // Scaffold(
    //     body: screens[navbarProvider.currentTab],
    //     bottomNavigationBar: Container(
    //       margin: const EdgeInsets.all(10),
    //       height: 50,

    //       ///background deco image
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(30),
    //         color: Colors.black.withOpacity(0.7),
    //       ),
    //       child: NavigationBarTheme(
    //         data: const NavigationBarThemeData(
    //           backgroundColor: Colors.transparent,
    //           indicatorColor: Colors.transparent,
    //         ),
    //         child: Center(
    //           child: NavigationBar(
    //             animationDuration: const Duration(seconds: 2),
    //             labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    //             selectedIndex: navbarProvider.currentTab,
    //             onDestinationSelected: (int idx) {
    //               Provider.of<NavbarProvider>(context, listen: false)
    //                   .updateScreen(idx);
    //             },
    //             destinations: const [
    //               ///search
    //               NavigationDestination(
    //                   icon: CircleAvatar(
    //                     backgroundColor: Colors.black,
    //                     child: Icon(
    //                       Icons.search,
    //                       color: Colors.white,
    //                       size: 30,
    //                     ),
    //                   ),
    //                   selectedIcon: CircleAvatar(
    //                     backgroundColor: Colors.orange,
    //                     child: Icon(
    //                       Icons.search,
    //                       color: Colors.yellow,
    //                       size: 30,
    //                     ),
    //                   ),
    //                   label: 'Search'),

    //               ///msg
    //               NavigationDestination(
    //                   icon: CircleAvatar(
    //                     backgroundColor: Colors.black,
    //                     child: Icon(
    //                       Icons.chat,
    //                       color: Colors.white,
    //                       size: 20,
    //                     ),
    //                   ),
    //                   selectedIcon: CircleAvatar(
    //                     backgroundColor: Colors.orange,
    //                     child: Icon(
    //                       Icons.chat,
    //                       color: Colors.yellow,
    //                       size: 20,
    //                     ),
    //                   ),
    //                   label: 'Search'),

    //               ///home
    //               NavigationDestination(
    //                   icon: CircleAvatar(
    //                     backgroundColor: Colors.black,
    //                     child: Icon(
    //                       Icons.home_filled,
    //                       color: Colors.white,
    //                       size: 20,
    //                     ),
    //                   ),
    //                   selectedIcon: CircleAvatar(
    //                     backgroundColor: Colors.orange,
    //                     child: Icon(
    //                       Icons.home_filled,
    //                       color: Colors.yellow,
    //                       size: 20,
    //                     ),
    //                   ),
    //                   label: 'Home'),

    //               ///fav
    //               NavigationDestination(
    //                   icon: CircleAvatar(
    //                     backgroundColor: Colors.black,
    //                     child: Icon(
    //                       Icons.favorite,
    //                       color: Colors.white,
    //                       size: 20,
    //                     ),
    //                   ),
    //                   selectedIcon: CircleAvatar(
    //                     backgroundColor: Colors.orange,
    //                     child: Icon(
    //                       Icons.favorite,
    //                       color: Colors.yellow,
    //                       size: 20,
    //                     ),
    //                   ),
    //                   label: 'Search'),

    //               ///persone
    //               NavigationDestination(
    //                 icon: CircleAvatar(
    //                   backgroundColor: Colors.black,
    //                   child: Icon(
    //                     Icons.person,
    //                     color: Colors.white,
    //                     size: 20,
    //                   ),
    //                 ),
    //                 selectedIcon: CircleAvatar(
    //                   backgroundColor: Colors.orange,
    //                   child: Icon(
    //                     Icons.person,
    //                     color: Colors.yellow,
    //                     size: 20,
    //                   ),
    //                 ),
    //                 label: 'Property',
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ));
  }
}
