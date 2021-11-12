import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TweenStaggeredPage extends StatefulWidget {
  const TweenStaggeredPage({Key? key}) : super(key: key);

  @override
  _TweenStaggeredPageState createState() => _TweenStaggeredPageState();
}

class _TweenStaggeredPageState extends State<TweenStaggeredPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final int _seconds = 5;
  late Animation<int> _integer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _seconds)
    )..addListener(() {
      setState(() {
      });
    });
    _integer = _animationController.drive(
      IntTween(begin: 0, end: _seconds)
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _integer.value.toString(),
              style: const TextStyle(fontSize: 64),
            ),
            Container(
              width: 120,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[300],
                onPrimary: Colors.black
              ),
              onPressed: _animationController.forward,
              child: const Text('再生')
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[300],
                onPrimary: Colors.black
              ),
              onPressed: _animationController.reverse,
              child: const Text('逆再生'))
          ],
        ),
      ),
    );
  }
}
