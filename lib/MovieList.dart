import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/Repositiriy.dart';

class MovieList extends StatefulWidget {
  const MovieList({required this.title, required this.data, super.key});
  final String title;
  final myData data;
  @override
  State<StatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  ScrollController controller = ScrollController();

  void scrollRight() {
    controller.animateTo(50,
        duration: Duration(milliseconds: 500), curve: Curves.bounceIn);
  }

  void scrollLeft() {
    controller.animateTo(0,
        duration: Duration(milliseconds: 500), curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton.icon(onPressed: scrollLeft, label: Icon(Icons.arrow_left)),
        Expanded(
            child: Container(
          width: 50,
          margin: EdgeInsets.all(10),
          height: 157,
          decoration: BoxDecoration(color: Colors.amber, border: Border.all()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (ctx, ind) {
                        return Container(
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey, border: Border.all()),
                        );
                      }))
            ],
          ),
        )),
        TextButton.icon(onPressed: scrollRight, label: Icon(Icons.arrow_right))
      ],
    );
  }
}
