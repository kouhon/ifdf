import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.blueAccent.withOpacity(0.3),
          floating: true,
          pinned: true,
          snap: false,
          expandedHeight: 180,
          toolbarHeight: 60,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              '記事カテゴリー'
            ),
            background: SizedBox(
              width: double.infinity,
              child: Image.network(
                'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }
}