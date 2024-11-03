// import 'package:bills/bill_model.dart';
import 'package:bills/pages/bill_details_page.dart';
import 'package:bills/model/bill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarView extends StatelessWidget {
  final int year;
  final int month;
  final List<Bill> bills;

  CalendarView({required this.year, required this.month, required this.bills});

  int _daysInMonth(int month, int year) {
    DateTime firstDayNextMonth =
        (month < 12) ? DateTime(year, month + 1, 1) : DateTime(year + 1, 1, 1);
    return firstDayNextMonth.subtract(const Duration(days: 1)).day;
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = _daysInMonth(month, year);
    final firstDayOfMonth = DateTime(year, month, 1);
    final startOffset = firstDayOfMonth.weekday - 1;

    final Bill dummyBill = Bill(
      id: -1,
      serviceName: '',
      logoUrl: '',
      lastPaidDate: '',
      nextDueDate: '',
      amountDue: 0.0,
      recurring: false,
    );

    return Padding(
      padding: EdgeInsets.all(4.0.sp),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 4.0.sp,
          crossAxisSpacing: 4.0.sp,
        ),
        itemCount: daysInMonth + startOffset,
        itemBuilder: (context, index) {
          if (index < startOffset) {
            return const SizedBox.shrink();
          }
          final day = index - startOffset + 1;
          final dateStr =
              DateTime(year, month, day).toIso8601String().split('T')[0];
          final Bill bill = bills.firstWhere(
            (bill) => bill.nextDueDate == dateStr,
            orElse: () => dummyBill,
          );
          return Center(
            child: GestureDetector(
              onTap: () {
                if (bill.id != -1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BillDetailsPage(bill: bill),
                    ),
                  );
                }
              },
              child: Container(
                height: 75.h,
                width: 75.w,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 65, 68, 54),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (bill.id != -1)
                        Image.asset(bill.logoUrl,
                            fit: BoxFit.contain, height: 20.h, width: 20.w),
                      Text(
                        day.toString(),
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
