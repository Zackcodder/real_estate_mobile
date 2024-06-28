import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  late Animation<double> _animation4;
  late Animation<double> _animation5;
  late AnimationController _buyAnimationController;
  late Animation<int> _buyAnimation;

  late AnimationController _rentAnimationController;
  late Animation<int> _rentAnimation;

  late AnimationController _sliderAnimationController;
  late Animation<Offset> _sliderAnimation;

  @override
  void initState() {
    super.initState();

    _buyAnimationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _buyAnimation =
        IntTween(begin: 0, end: 1030).animate(_buyAnimationController)
          ..addListener(() {
            setState(() {});
          });
    _buyAnimationController.forward();

    _rentAnimationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _rentAnimation =
        IntTween(begin: 0, end: 2212).animate(_rentAnimationController)
          ..addListener(() {
            setState(() {});
          });
    _rentAnimationController.forward();

    _sliderAnimationController = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    );
    _sliderAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: _sliderAnimationController,
      curve: const Interval(0.9, 1, curve: Curves.easeInOut),
    ));
    _sliderAnimationController.forward();

    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation5 = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
    );

    _animation1 = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 0.6, curve: Curves.easeInOut),
    );

    _animation2 = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.7, 0.9, curve: Curves.easeInOut),
    );

    _animation3 = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.8, 0.9, curve: Curves.easeInOut),
    );

    _animation4 = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.9, 1, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _buyAnimationController.dispose();
    _rentAnimationController.dispose();
    _sliderAnimationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedWidget(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, -0.1), end: Offset.zero)
            .animate(animation),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 237, 237),
      body: Container(
        margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///search box
                _buildAnimatedWidget(
                  _animation1,
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: TextField(
                        // textAlign: TextAlign.start,
                        onChanged: ((value) {}),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 2),
                          hintText: 'Saint PertersBurg',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon: Icon(
                            Icons.location_on,
                            size: 25.0,
                            weight: 10,
                            color: Colors.grey,
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
                  ),
                ),
                _buildAnimatedWidget(
                  _animation5,
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://www.befunky.com/images/wp/wp-2021-01-linkedin-profile-picture-after.jpg?auto=avif,webp&format=jpg&width=944'), // Replace with your image URL
                  ),
                ),
              ],
            ),

            ///welcome note
            const SizedBox(height: 20),
            _buildAnimatedWidget(
              _animation2,
              const Text('Hi, Marina',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey)),
            ),
            _buildAnimatedWidget(
              _animation2,
              const Text("Let's select your \nperfect place",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 50),
            _buildAnimatedWidget(
              _animation3,
              Row(
                children: [
                  ///rounded
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'BUY',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '${_buyAnimation.value}',
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Offers',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Rent',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '${_rentAnimation.value}',
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Offers',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            ///first apartment
            _buildAnimatedWidget(
              _animation4,
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/house.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 16.0 * _sliderAnimationController.value,
                    right: 10,
                    child: SlideTransition(
                      position: _sliderAnimation,
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 50),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gladkova St., 25',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Icon(Icons.arrow_forward,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            ///second payment
            _buildAnimatedWidget(
              _animation4,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/house1.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: SlideTransition(
                              position: _sliderAnimation,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gladkova St., 25',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.arrow_forward,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   bottom: 10,
                        //   left: 16.0 * _sliderAnimationController.value,
                        //   child: Container(
                        //     margin: EdgeInsets.only(right: 10),
                        //     height: 50,
                        //     width: MediaQuery.of(context).size.width *
                        //         0.5, // Adjust width as needed
                        //     padding: const EdgeInsets.only(left: 50),
                        //     decoration: BoxDecoration(
                        //       color: Colors.grey.withOpacity(0.9),
                        //       borderRadius: BorderRadius.circular(50),
                        //     ),
                        //     child: SlideTransition(
                        //       position: _sliderAnimation,
                        //       child: const Row(
                        //         children: [
                        //           Text(
                        //             'Gladkova St., 25',
                        //             style: TextStyle(
                        //                 color: Colors.black, fontSize: 14),
                        //           ),
                        //           SizedBox(width: 10),
                        //           CircleAvatar(
                        //               radius: 25,
                        //               backgroundColor: Colors.white,
                        //               child: Icon(Icons.arrow_forward,
                        //                   color: Colors.black)),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 145,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/house2.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: SlideTransition(
                              position: _sliderAnimation,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gladkova St., 25',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.arrow_forward,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 145,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/house3.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: SlideTransition(
                              position: _sliderAnimation,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Gladkova St., 25',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.arrow_forward,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
