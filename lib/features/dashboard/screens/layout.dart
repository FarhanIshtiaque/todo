import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/features/dashboard/screens/done_task.dart';
import 'package:todo/features/dashboard/screens/pending_task.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 0;
  final PageController controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: AppBar(
    ),
      body:PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children:  [PendingTask(), DoneTask()],
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        isFloating: true,
        selectedColor: AppColors.primary,
        strokeColor: AppColors.primary,
        unSelectedColor: Colors.white,
        backgroundColor: Colors.black,
        borderRadius: const Radius.circular(30.0),
        items: [


          CustomNavigationBarItem(
            icon: const Icon(Iconsax.document),
            selectedIcon: const Icon(Iconsax.document),
            // title: Text("Explore"),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Iconsax.task),
            selectedIcon: const Icon(Iconsax.task),
            // title: Text("Search"),
          ),

        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          HapticFeedback.lightImpact();
          controller.animateToPage(index,
              duration: const Duration(microseconds: 400),
              curve: Curves.easeInOutCubicEmphasized);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // setState(() {
          //   index = (index + 1) % customizations.length;
          // });
        },
        shape:CircleBorder(),

        child: const Icon(Icons.add),
      ),

    );
  }
}
