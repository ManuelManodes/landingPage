import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTittle(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMenuItem(delay: 0, text: 'Home', onPressed: () {}),
                CustomMenuItem(delay: 100, text: 'About', onPressed: () {}),
                CustomMenuItem(delay: 200, text: 'Contact', onPressed: () {}),
                CustomMenuItem(delay: 300, text: 'Location', onPressed: () {}),
                CustomMenuItem(delay: 400, text: 'Pricing', onPressed: () {}),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTittle extends StatelessWidget {
  const _MenuTittle({required this.isOpen, required this.controller});

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text(
            'Menú',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 16),
          ),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
