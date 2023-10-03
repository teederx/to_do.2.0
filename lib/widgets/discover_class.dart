import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gif_view/gif_view.dart';

class DiscoverClass extends HookWidget {
  const DiscoverClass({required this.screenHeight, super.key});
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    const collapsedBarHeight = 60.0;
    const expandedBarHeight = 150.0;
    final scrollController = ScrollController();
    final isCollapsed = useState(false);
    var tabBar = TabBar(
      isScrollable: true,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black54,
      //TODO: Set boxdecoration for the unindicated items as well...
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 204, 189, 230),
      ),
      tabs: const [
        Tab(text: 'All'),
        Tab(text: 'Tiktok Influencer'),
        Tab(text: 'Study'),
        Tab(text: 'Relax'),
        Tab(text: 'Healthy Lifestyle'),
        Tab(text: 'Morning Routine'),
        Tab(text: 'Better Sleep'),
        Tab(text: 'Clean Room'),
        Tab(text: 'Workout'),
      ],
    );

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
              bottom: tabBar,
              stretch: true,

              /// 1
              // Collapsed appbar content
              title: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isCollapsed.value ? 1 : 0,
                child: const Text(
                  'Routine Plan',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              elevation: 0,

              /// 2
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  color: Colors.black,
                  onPressed: () {},
                  icon: const Icon(Icons.search_rounded),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    GifView.asset(
                      'assets/2r5w.gif',
                      height: expandedBarHeight,
                      width: double.infinity,
                      frameRate: 7,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 20,
                      top: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Routine Plan',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            'A place to discover the good life',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
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
                  elevation: 7,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: SizedBox(
                    height: screenHeight,
                    child: const TabBarView(
                      children: <Widget>[
                        Center(
                          child: Text("It's cloudy here"),
                        ),
                        Center(
                          child: Text("It's rainy here"),
                        ),
                        Center(
                          child: Text("It's sunny here"),
                        ),
                        Center(
                          child: Text("It's cloudy here"),
                        ),
                        Center(
                          child: Text("It's rainy here"),
                        ),
                        Center(
                          child: Text("It's sunny here"),
                        ),
                        Center(
                          child: Text("It's cloudy here"),
                        ),
                        Center(
                          child: Text("It's rainy here"),
                        ),
                        Center(
                          child: Text("It's sunny here"),
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
