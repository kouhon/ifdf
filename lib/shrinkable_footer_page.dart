import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ShrinkableFooterPage extends StatefulWidget {
  const ShrinkableFooterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShrinkableFooterPageState();
  }
}

class _ShrinkableFooterPageState extends State<ShrinkableFooterPage> {
  final _scrollController = ScrollController();
  bool isHiding = false;

  @override
  void initState() {
    super.initState();
    _listenScroll();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 50),
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)
                    ),
                    color: Color(0xFFFEEAE6)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(height: 70),
                      Text(
                        'スクロールに応じて\nBottomNavigationBarが\n縮みます。',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Color(0xFF442C2E),
                          height: 1.1
                        ),
                      ),
                      SizedBox(height: 20.0)
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Image.network('https://images.unsplash.com/photo-1528164344705-47542687000d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1369&q=80'),
                const SizedBox(height: 20),
                Image.network('https://images.unsplash.com/photo-1528164344705-47542687000d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1369&q=80'),
                const SizedBox(height: 20),
                Image.network('https://images.unsplash.com/photo-1528164344705-47542687000d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1369&q=80'),
                const SizedBox(height: 20),
                Image.network('https://images.unsplash.com/photo-1528164344705-47542687000d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1369&q=80'),
                const SizedBox(height: 20),
                Image.network('https://images.unsplash.com/photo-1528164344705-47542687000d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1369&q=80'),
                const SizedBox(height: 20)
              ],
            ),
            Positioned(
              bottom: 0,
              child: _BottomNavigationBar(isHiding: isHiding),
            )
          ]
        ),
      )
    );
  }

  void _listenScroll() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        isHiding = true;
      } else {
        isHiding = false;
      }
      setState(() {});
    });
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({required this.isHiding});
  
  final bool isHiding;
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isHiding ? 21 : 60,
      color: const Color(0xfffeeae6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.home,
              title: 'Home'
            ),
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.star,
              title: 'Favorite',
            ),
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.favorite,
              title: 'Like',
            ),
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.settings,
              title: 'Menu',
            )
          ],
        ),
      ),
    );
  }
}

class _IconTextItem extends StatelessWidget {
  const _IconTextItem({
    Key? key,
    required this.deviceWidth,
    required this.icon,
    required this.title
  }) : super(key: key);

  final double deviceWidth;

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.25 * (deviceWidth - 32),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Icon(
              icon,
              color: const Color(0xFF442c2e),
              size: 24,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            )
          )
        ],
      ),
    );
  }
}