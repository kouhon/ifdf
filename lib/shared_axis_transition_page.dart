import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SharedAxisTransitionPage extends StatefulWidget {
  const SharedAxisTransitionPage({Key? key}) : super(key: key);

  @override
  _SharedAxisTransitionPageState createState() => _SharedAxisTransitionPageState();
}

class _SharedAxisTransitionPageState extends State<SharedAxisTransitionPage> {
  final SharedAxisTransitionType _transitionType = SharedAxisTransitionType.horizontal;
  bool _isCatImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageTransitionSwitcher(
                duration: const Duration(milliseconds: 800),
                reverse: !_isCatImage,
                transitionBuilder: (Widget child, Animation<double> animation, Animation<double> secondaryAnimation) => SharedAxisTransition(
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: _transitionType,
                ),
                child: _isCatImage ? const _CatImage() : const _DogImage(),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[300],
                onPrimary: Colors.black,
              ),
              onPressed: _toggleImages,
              child: const Text('切り替える'),
            )
          ],
        ),
      ),
    );
  }

  void _toggleImages() {
    setState(() {
      _isCatImage = !_isCatImage;
    });
  }
}


class _CatImage extends StatelessWidget {
  const _CatImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Image.network(
                'https://images.pexels.com/photos/1770918/pexels-photo-1770918.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'これは猫です。',
              style: TextStyle(
                fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DogImage extends StatelessWidget {
  const _DogImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Image.network(
                'https://images.pexels.com/photos/4681107/pexels-photo-4681107.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'これは犬です。',
              style: TextStyle(
                fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}
