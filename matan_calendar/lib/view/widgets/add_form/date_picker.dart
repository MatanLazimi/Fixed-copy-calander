import 'package:flutter/material.dart';
import 'package:matan_calendar/view/style/strings.dart';

class DatePickerUI extends StatelessWidget {
  final DateTime date;
  final Function()? onTapDate;

  const DatePickerUI({Key? key, required this.date, required this.onTapDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.DATE,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 20),
        Container(
          height: 80,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: onTapDate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.PRESS_DATE,
                  softWrap: false,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  date.day.toString() +
                      Strings.SLESH +
                      date.month.toString() +
                      Strings.SLESH +
                      date.year.toString(),
                  softWrap: false,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
