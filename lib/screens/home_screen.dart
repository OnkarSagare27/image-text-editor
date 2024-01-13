import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_editor/widgets/snackbar.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_editor/providers/edit_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_editor/widgets/custom_outlined_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<EditProvider>(
      builder: (context, editProvider, child) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              tooltip: 'Add',
              onPressed: () => editProvider.showDialogBox(context),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            editProvider.image != null
                ? IconButton(
                    tooltip: 'Undo',
                    onPressed: () {},
                    icon: const Icon(
                      Icons.undo_outlined,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox(),
            editProvider.image != null
                ? IconButton(
                    tooltip: 'Redo',
                    onPressed: () {},
                    icon: const Icon(
                      Icons.redo_rounded,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox(),
            editProvider.image != null
                ? IconButton(
                    tooltip: 'Save',
                    onPressed: () => _saveImage(),
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox(),
            editProvider.image != null
                ? IconButton(
                    tooltip: 'Reset',
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cancel_rounded,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox(),
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
                child: Container(
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
                        : RepaintBoundary(
                            key: globalKey,
                            child: Stack(
                              fit: StackFit.expand,
                              children: editProvider.textStack,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 130.h,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit_note,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
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
                        icon: Icons.align_vertical_bottom_rounded,
                      ),
                      CustomOutlinedButton(
                        onPressed: () {},
                        icon: Icons.align_vertical_center_rounded,
                      ),
                      CustomOutlinedButton(
                        onPressed: () {},
                        icon: Icons.align_horizontal_center_rounded,
                      ),
                      CustomOutlinedButton(
                        onPressed: () {},
                        icon: Icons.align_vertical_top_rounded,
                      ),
                      CustomOutlinedButton(
                        onPressed: () {},
                        icon: Icons.align_horizontal_right_rounded,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveImage() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8List = byteData!.buffer.asUint8List();
    final result = await ImageGallerySaver.saveImage(uint8List);

    if (result['isSuccess']) {
      showSnackBar(context, 'Image saved at ${result['filePath']}');
    } else {
      showSnackBar(context, 'Failed to save image');
    }
  }
}
