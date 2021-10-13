import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
