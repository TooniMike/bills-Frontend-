import 'package:bills/widget/calender_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'SubCal',
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'English',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 200.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Introducing SubCal',
                      style: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 30.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.grey,
                        size: 15.h,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Never Miss a Payment Renewal Again.',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Stay organized with our Subscriptions Calender that keeps track of all your service renewals and billing service renewals and billing date in one place.',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  color: Colors.grey,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _button('Get Started', true),
                  SizedBox(
                    width: 20.w,
                  ),
                  _button('Try Demo', false),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '30-day trail, no credit card required',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                RatingStars(
                  value: 4.5,
                  starBuilder: (index, color) => const Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  starCount: 5,
                  starSize: 20.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Average user rating',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                ),
              ]),
              SizedBox(
                height: 30.h,
              ),
              const Expanded(child: CalendarPage())
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(String text, bool isActive) {
    return Container(
      height: 40.h,
      width: 130.w,
      decoration: BoxDecoration(
          color:
              isActive ? Colors.white : const Color.fromARGB(255, 65, 68, 54),
          borderRadius: BorderRadius.circular(30.r)),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.kanit(
            color: isActive ? Colors.black : Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
