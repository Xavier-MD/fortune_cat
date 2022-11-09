import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fortune Cat'),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.refresh_rounded),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.star_border_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image(
                  width: 80.0.w,
                  fit: BoxFit.fitWidth,
                  image: const AssetImage('assets/images/cats/nigel.png'),
                ),
                Image(
                  width: 80.0.w,
                  fit: BoxFit.fitWidth,
                  image: const AssetImage(
                      'assets/images/accessories/eyes/sunglasses_1.png'),
                ),
                Image(
                  width: 80.0.w,
                  fit: BoxFit.fitWidth,
                  image: const AssetImage(
                      'assets/images/accessories/paws/book_1.png'),
                ),
              ],
            ),
            SizedBox(height: 5.0.h),
            Container(
              width: 80.0.w,
              height: 20.0.h,
              padding: EdgeInsets.all(2.0.h),
              child: const Text(
                'Cat man occasionally partakes in the cat dance.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
