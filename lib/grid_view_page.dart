
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GridViewPageState();
  }

}

class _GridViewPageState extends State<GridViewPage> {
  int _columnsCount = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "grid_on",
            onPressed: () {
              if (_columnsCount < 3) {
                setState(() {
                  _columnsCount++;
                });
              }
            },
            child: const Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: "grid_off",
            onPressed: () {
              if (_columnsCount > 2) {
                setState(() {
                  _columnsCount--;
                });
              }
            },
            child: const Icon(
              Icons.grid_off,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: "arrow_upward",
            onPressed: () {},
            child: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _columnsCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.black,
            child: Center(
              child: Text(
                index.toString(),
                style: const TextStyle(
                  fontSize: 42,
                  color: Colors.white
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}