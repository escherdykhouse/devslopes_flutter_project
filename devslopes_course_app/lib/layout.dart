import 'package:flutter/material.dart';

class PercentageRow extends StatelessWidget {
  final double percentage;
  final Color color;

  PercentageRow(this.percentage,this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: this.percentage,
            child: Container(
                color: this.color,
                height: 20,
                margin: EdgeInsets.only(bottom: 8)),
          ),
        ),
      ],
    );
  }
}

class LayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //Containers need to have infinity as h/w if you want it to cover the entire screen with a smaller child
      padding: EdgeInsets.all(16),
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8),
            color: Colors.deepOrange,
            height: 60,
          ),
          //Rows only take up as much space as their children need
          Row(
            children: <Widget>[
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8, right: 4),
                    color: Colors.orange,
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 8, left: 4),
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 8, left: 4),
                          color: Colors.deepOrange,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.deepOrangeAccent,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.deepOrange,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.orange,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.deepOrangeAccent,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 1.0,
            child: Container(
                color: Colors.orange,
                height: 20,
                margin: EdgeInsets.only(bottom: 8)),
          ),

          PercentageRow(0.75,Colors.deepOrangeAccent),
          PercentageRow(0.5,Colors.deepOrange),
        ],
      ),
    );
  }
}
