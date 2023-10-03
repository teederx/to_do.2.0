import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LibraryClass extends HookWidget {
  const LibraryClass({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final isCollapsed = useState(false);
    const collapsedBarHeight = 60.0;
    const expandedBarHeight = 120.0;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        /// 2
        isCollapsed.value = scrollController.hasClients &&
            scrollController.offset > (expandedBarHeight - collapsedBarHeight);
        return false;
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 1),
              opacity: isCollapsed.value ? 1 : 0,
              child: const Text(
                'Library',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            pinned: true,
            stretch: true,
            expandedHeight: expandedBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              expandedTitleScale: 2.0,
              title: AnimatedOpacity(
                duration: const Duration(milliseconds: 1),
                opacity: isCollapsed.value ? 0 : 1,
                child: const Text(
                  'Library',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Card(
                elevation: 5,
                shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text('$index'),
                ),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
