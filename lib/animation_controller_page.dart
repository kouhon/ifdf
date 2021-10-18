import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class AnimationControllerPage extends StatefulWidget {
  const AnimationControllerPage({Key? key}) : super(key: key);

  @override
  _AnimationControllerPageState createState() => _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15)
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
            const Text(
              '_animationController\n.value = ',
              style: TextStyle(
                fontSize: 22
              ),
            ),
            const Text(
              '1.00',
              style: TextStyle(
                fontSize: 64
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.play_arrow),
                    Text(
                      '再生'
                    )
                  ],
                ),
              )
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: math.pi,
                      child: const Icon(Icons.play_arrow),
                    ),
                    const Text(
                      '逆再生'
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: math.pi,
                      child: const Icon(Icons.pause),
                    ),
                    const Text(
                      '一時停止'
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.stop),
                    Text(
                      '停止'
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.repeat),
                    Text(
                      'リピート'
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const Text(
              'Duration',
              style: TextStyle(
                fontSize: 22
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Radio(value: null, groupValue: null, onChanged: null,),
                Text('15秒'),
                Radio(value: null, groupValue: null, onChanged: null,),
                Text('30秒'),
                Radio(value: null, groupValue: null, onChanged: null,),
                Text('60秒'),
              ],
            )
          ],
        ),
      ),
    );
  }
}