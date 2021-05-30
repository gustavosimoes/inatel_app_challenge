import 'package:flutter/material.dart';
import 'package:inatel_app_challenge/core/colors.dart';

class MetricContainer extends StatelessWidget {
  Color color;
  Color textColor;
  AlignmentGeometry alignmentGeometry;
  String title;
  String metric;
  Icon icon;

  MetricContainer({
    this.color,
    this.textColor,
    this.icon,
    this.metric,
    this.title,
    this.alignmentGeometry,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: alignmentGeometry,
        child: Wrap(
          spacing: 15,
          runSpacing: 5,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.spaceAround,
          children: [
            icon,
            Text(
              '$title: $metric',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color:
                      textColor == null ? ColorsApp.colorsList[3] : textColor,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
