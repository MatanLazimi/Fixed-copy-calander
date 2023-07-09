import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerWidget extends ConsumerStatefulWidget {
  const DatePickerWidget(
      {super.key,
      required this.popCallback,
      required this.selectCallback,
      required this.initalDate});

  final Function popCallback;
  final DateTime initalDate;
  final Function(DateTime date) selectCallback;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends ConsumerState<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    var chosenDate = widget.initalDate;
    return StatefulBuilder(builder: (con, setState) {
      var day = DateFormat.EEEE().format(chosenDate).substring(0, 3);
      var month = DateFormat.MMMM().format(chosenDate).substring(0, 3);
      var year = chosenDate.year.toString().substring(2, 4);
      return Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            //color of border
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          width: 328.35,
          height: 500,
          child: Column(
            children: [
              Container(
                width: 328.35,
                color: Theme.of(context).primaryColor,
                height: 114,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select a date',
                        softWrap: false,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Text(
                        day + ', ' + month + ' ' + year,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  //start from monday
                  child: SfDateRangePicker(
                    initialDisplayDate: chosenDate,
                    view: DateRangePickerView.month,
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                      todayTextStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                      selectionTextStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    todayHighlightColor: Colors.black,
                    initialSelectedDate: chosenDate,
                    monthViewSettings: const DateRangePickerMonthViewSettings(
                      firstDayOfWeek: 1,
                      dayFormat: 'EE',
                    ),
                    showActionButtons: true,
                    showNavigationArrow: true,
                    selectionColor: Theme.of(context).primaryColor,
                    selectionMode: DateRangePickerSelectionMode.single,
                    onCancel: () {
                      widget.popCallback();
                    },
                    onSubmit: (value) {
                      if (value is DateTime) widget.selectCallback(value);
                      widget.popCallback();
                    },
                    onSelectionChanged:
                        (DateRangePickerSelectionChangedArgs args) {
                      setState(() {
                        chosenDate = args.value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
