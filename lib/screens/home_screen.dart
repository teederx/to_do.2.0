import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_2_0/widgets/discover_class.dart';
import 'package:todo_2_0/widgets/library_class.dart';
import 'package:todo_2_0/widgets/profile_class.dart';

import '../widgets/routine_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var bottomNavigation = NavigationBar(
      elevation: 10,
      shadowColor: Colors.black,
      backgroundColor: Colors.white,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: currentPageIndex,
      animationDuration: const Duration(seconds: 1),
      destinations: <Widget>[
        const NavigationDestination(
          selectedIcon: Icon(Icons.wysiwyg_rounded),
          icon: Icon(
            Icons.wysiwyg_outlined,
            color: Colors.black54,
          ),
          label: 'Routine',
        ),
        const NavigationDestination(
          selectedIcon: Icon(Icons.sort),
          icon: Icon(
            Icons.sort_outlined,
            color: Colors.black54,
          ),
          label: 'Discover',
        ),
        NavigationDestination(
          selectedIcon: SvgPicture.asset(
            'assets/noun-telescope-2145896.svg',
            height: 30,
            width: 30,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          icon: SvgPicture.asset(
            'assets/noun-telescope-2145896.svg',
            height: 30,
            width: 30,
            colorFilter:
                const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
          ),
          label: 'Library',
        ),
        const NavigationDestination(
          selectedIcon: Icon(Icons.equalizer),
          icon: Icon(
            Icons.equalizer_outlined,
            color: Colors.black54,
          ),
          label: 'Profile',
        ),
      ],
    );
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    Size screenSize = MediaQuery.of(context).size;
    var bottomSpace = MediaQuery.of(context).viewPadding.bottom;
    var screenHeight = screenSize.height - 55 - statusBarHeight - bottomSpace;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 55,
        child: bottomNavigation,
      ),
      body: <Widget>[
        RoutineClass(
          screenHeight: screenHeight,
        ),
        DiscoverClass(
          screenHeight: screenHeight,
        ),
        const LibraryClass(),
        ProfileClass(
          screenHeight: screenHeight,
        ),
      ][currentPageIndex],
    );
  }
}
