import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
            title: Text(
              '記事カテゴリー',
              style: GoogleFonts.kosugiMaru(),
            ),
            background: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      stops: const [0.5, 1],
                      colors: [
                        Colors.grey.withOpacity(0),
                        Colors.black38
                      ]
                    )
                  ),
                )
              ],
            ),
          ),
        ),
        SliverList(delegate: SliverChildListDelegate(
          <Widget>[
            Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Sept. 29 2020',
                            style: GoogleFonts.lato(),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.share,
                            color: Colors.blueAccent
                          ),
                          onPressed: (){},
                        )
                      ],
                    ),
                    Text(
                      '記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル',
                      style: GoogleFonts.sawarabiGothic(),
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: const NetworkImage(
                            'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb7dpr=2&h=650&w=940'
                          ),
                          radius: 26,
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '山田　太郎'
                            ),
                            Text(
                              'ITジャーナリスト'
                            )
                          ],
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '350',
                          style: GoogleFonts.lato(),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Icon(
                          Icons.comment,
                          color: Colors.blueAccent
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '25',
                          style: GoogleFonts.lato(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト',
                      style: GoogleFonts.sawarabiGothic(),
                    )
                  ],
                ),
              )
            )
          ]
        ))
      ]),
    );
  }
}