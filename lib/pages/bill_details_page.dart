import 'package:bills/model/bill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BillDetailsPage extends StatelessWidget {
  final Bill bill;

  const BillDetailsPage({required this.bill});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios)),
          title: Text(
            'Make Payment',
            style: GoogleFonts.kanit(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                height: MediaQuery.of(context).size.height * .75,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5.r,
                      blurRadius: 10.r,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),
                    Image.asset(
                      bill.logoUrl,
                      height: 150.h,
                      width: 300.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      bill.serviceName,
                      style: GoogleFonts.kanit(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount Due',
                            style: GoogleFonts.kanit(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            '\$${bill.amountDue}',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 22.sp,
                            ),
                          )
                        ]),
                    SizedBox(height: 15.h),
                    _rowDetails('Last Paid Date', bill.lastPaidDate),
                    SizedBox(height: 10.h),
                    _rowDetails('Next Due Date', bill.nextDueDate),
                    SizedBox(height: 10.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recurring',
                            style: GoogleFonts.kanit(
                              color: Colors.white70,
                              fontSize: 20.sp,
                            ),
                          ),
                          Text(
                            bill.recurring ? "Yes" : "No",
                            style: GoogleFonts.kanit(
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          )
                        ]),
                    SizedBox(height: 20.h),
                    QrImageView(
                      data: '1234567890',
                      version: QrVersions.auto,
                      size: 120.0,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Scan QRcode',
                      style: GoogleFonts.kanit(
                        color: Colors.white70,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 300.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40.r)),
                child: Center(
                    child: Text(
                  'Make Payment',
                  style: GoogleFonts.kanit(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _rowDetails(String title, String subtitle) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(
      title,
      style: GoogleFonts.kanit(
        color: Colors.white70,
        fontSize: 14.sp,
      ),
    ),
    Text(
      subtitle,
      style: GoogleFonts.kanit(
        color: Colors.white70,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
    )
  ]);
}
