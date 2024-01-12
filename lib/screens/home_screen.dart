import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_editor/providers/edit_provider.dart';
import 'package:image_editor/widgets/custom_outlined_button.dart';
import 'package:image_editor/widgets/drag.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EditProvider>(
      builder: (context, editProvider, child) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              tooltip: 'Reset',
              onPressed: () {},
              icon: const Icon(
                Icons.cancel_rounded,
                color: Colors.white,
              ),
            ),
            IconButton(
              tooltip: 'Add',
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            IconButton(
              tooltip: 'Undo',
              onPressed: () {},
              icon: const Icon(
                Icons.undo_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              tooltip: 'Redo',
              onPressed: () {},
              icon: const Icon(
                Icons.redo_rounded,
                color: Colors.white,
              ),
            ),
            IconButton(
              tooltip: 'Delete',
              onPressed: () {},
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.white,
              ),
            ),
          ],
          title: const Text(
            'Editor',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => editProvider.image == null
                    ? editProvider.selectImage(context)
                    : null,
                child: Stack(children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: editProvider.image == null
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    color: Colors.grey[600],
                                    size: 80,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'Tap here to import an image',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          : Image.file(
                              editProvider.image!,
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                  DraggableTextWidget(
                      text: 'Hi',
                      textStyle: TextStyle(color: Colors.amber, fontSize: 195),
                      initialPosition: Offset(
                          MediaQuery.of(context).size.width / 2,
                          MediaQuery.of(context).size.height / 2))
                ]),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 80.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  CustomOutlinedButton(
                    onPressed: () {},
                    icon: Icons.text_increase_rounded,
                  ),
                  CustomOutlinedButton(
                    onPressed: () {},
                    icon: Icons.text_decrease_rounded,
                  ),
                  CustomOutlinedButton(
                    onPressed: () {},
                    icon: Icons.align_horizontal_left_rounded,
                  ),
                  CustomOutlinedButton(
                    onPressed: () {},
                    icon: Icons.format_align_center_rounded,
                  ),
                  CustomOutlinedButton(
                    onPressed: () {},
                    icon: Icons.align_horizontal_right_rounded,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
