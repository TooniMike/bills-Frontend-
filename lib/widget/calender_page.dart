// import 'dart:convert';
// import 'package:bills/bill_model.dart';
import 'package:bills/widget/calendar_view.dart';
import 'package:bills/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
// import 'package:http/http.dart' as http;

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _currentDate = DateTime.now();

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final monthName = intl.DateFormat('MMMM yyyy').format(_currentDate);

    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: _previousMonth,
            ),
            Text(
              monthName,
              style: GoogleFonts.kanit(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_forward,
              ),
              onPressed: _nextMonth,
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  'Monthly Stipend',
                  style: GoogleFonts.kanit(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                  ),
                ),
                Text(
                  '\$3,021.01',
                  style: GoogleFonts.kanit(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Days(day: 'MON'),
            Days(day: 'TUE'),
            Days(day: 'WED'),
            Days(day: 'THU'),
            Days(day: 'FRI'),
            Days(day: 'SAT'),
            Days(day: 'SUN'),
          ],
        ),
        Expanded(
          child: CalendarView(
            year: _currentDate.year,
            month: _currentDate.month,
            bills: bills,
            // bills: _bills
          ),
        ),
      ],
    );
  }
}

Widget Days({required String day}) {
  return Container(
    height: 25.h,
    width: 40.w,
    decoration: BoxDecoration(
      color: Colors.white12,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Center(
      child: Text(
        day,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontSize: 12.sp),
      ),
    ),
  );
}
