import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_2_0/screens/feed_back_screen.dart';

class ProfileClass extends HookWidget {
  const ProfileClass({required this.screenHeight, super.key});
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    const collapsedBarHeight = 60.0;
    const expandedBarHeight = 120.0;
    final scrollController = ScrollController();
    final isCollapsed = useState(false);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        /// 2
        isCollapsed.value = scrollController.hasClients &&
            scrollController.offset > (expandedBarHeight - collapsedBarHeight);
        return false;
      },
      child: DefaultTabController(
        initialIndex: 1,
        length: 9,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: expandedBarHeight,
              collapsedHeight: collapsedBarHeight,
              centerTitle: true,
              pinned: true,
              stretch: true,

              /// 1
              // Collapsed appbar content
              title: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isCollapsed.value ? 1 : 0,
                child: const Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              elevation: 0,

              /// 2
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  color: Colors.black,
                  onPressed: () =>
                      Navigator.pushNamed(context, FeedBackScreen.routeName),
                  icon: SvgPicture.asset(
                    'assets/noun-profile-1079819.svg',
                    height: 30,
                    width: 30,
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: const [
                    SizedBox(
                      height: expandedBarHeight,
                    ),
                    Positioned(
                      left: 20,
                      top: 70,
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Material(
                  // elevation: 0,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: Text(
                            'Help & Feedback',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Card(
                          shape: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          elevation: 8,
                          margin: const EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15,
                            bottom: 30,
                          ),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Icons.book_rounded,
                                  color: Colors.black,
                                ),
                                title: const Text(
                                  'Help Center',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.black,
                                ),
                                onTap: () => null,
                              ),
                              const Divider(
                                thickness: 2,
                                indent: 20,
                                endIndent: 20,
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.mail_rounded,
                                  color: Colors.black,
                                ),
                                title: const Text(
                                  'Feedback',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.black,
                                ),
                                onTap: () => Navigator.pushNamed(
                                    context, FeedBackScreen.routeName),
                              ),
                              const Divider(
                                thickness: 2,
                                indent: 20,
                                endIndent: 20,
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.black,
                                ),
                                title: const Text(
                                  'Rate Us',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.black,
                                ),
                                onTap: () => null,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Card(
                          shape: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          elevation: 8,
                          margin: const EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15,
                            bottom: 30,
                          ),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Icons.security_rounded,
                                  color: Colors.black,
                                ),
                                title: const Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.black,
                                ),
                                onTap: () => null,
                              ),
                              const Divider(
                                thickness: 2,
                                indent: 20,
                                endIndent: 20,
                              ),
                              ListTile(
                                leading: SvgPicture.asset(
                                  'assets/noun-terms-and-conditions-3382682.svg',
                                  height: 35,
                                  width: 35,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                                ),
                                title: const Text(
                                  'Terms of Service',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.black,
                                ),
                                onTap: () => null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//import 'package:flutter/services.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter/material.dart';
// import 'package:gif_view/gif_view.dart';

// class DiscoverClass extends HookWidget {
//   const DiscoverClass({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const collapsedBarHeight = 60.0;
//     const expandedBarHeight = 400.0;
//     final scrollController = useScrollController();
//     final isCollapsed = useState(false);
//     final didAddFeedback = useState(false);

//     return NotificationListener<ScrollNotification>(
//       onNotification: (notification) {
//         /// 2
//         isCollapsed.value = scrollController.hasClients &&
//             scrollController.offset > (expandedBarHeight - collapsedBarHeight);

//         /// When the app bar is collapsed and the feedback
//         /// hasn't been added previously will invoke
//         /// the `mediumImpact()` method, otherwise will
//         /// reset the didAddFeedback value.
//         ///
//         if (isCollapsed.value && !didAddFeedback.value) {
//           HapticFeedback.mediumImpact();
//           didAddFeedback.value = true;
//         } else if (!isCollapsed.value) {
//           didAddFeedback.value = false;
//         }
//         return false;
//       },
//       child: Stack(
//         children: [
//           CustomScrollView(
//             controller: scrollController,
//             slivers: [
//               SliverAppBar(
//                 expandedHeight: expandedBarHeight,
//                 collapsedHeight: collapsedBarHeight,
//                 centerTitle: false,
//                 pinned: true,

//                 /// 1
//                 title: AnimatedOpacity(
//                   duration: const Duration(milliseconds: 200),
//                   opacity: isCollapsed.value ? 1 : 0,
//                   child: const Text('Routine Plan'),
//                 ),
//                 elevation: 0,

//                 /// 2
//                 backgroundColor: Colors.transparent,
//                 leading: const BackButton(
//                   color: Colors.white,
//                 ),

//                 /// 3
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: GifView.asset(
//                     'assets/2r5w.gif',
//                     height: 30,
//                     width: 30,
//                     frameRate: 7,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Column(
//                     children: [
//                       const Text('Routine Plan'),
//                       const Text('A place to discover the good life')
//                     ],
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(
//                     minHeight: MediaQuery.of(context).size.height,
//                   ),
//                   child: Material(
//                     elevation: 7,
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(15),
//                       topRight: Radius.circular(15),
//                     ),
//                     child: Container(
//                       color: Colors.white,
//                       height: 2000,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
