import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImagePostApi extends StatefulWidget {
  const UploadImagePostApi({super.key});

  @override
  State<UploadImagePostApi> createState() => _UploadImagePostApiState();
}

class _UploadImagePostApiState extends State<UploadImagePostApi> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickFile != null) {
      image = File(pickFile.path);
      setState(() {});
    } else {
      debugPrint('Image not selected');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });
    var stream = http.ByteStream(image!.openRead());
    var length = await image!.length();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var request = http.MultipartRequest('Post', uri);

    request.fields['title'] = 'static title';

    var multiport = http.MultipartFile('image', stream, length);
    request.files.add(multiport);
    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      debugPrint('Image Uploaded');
      debugPrint(response.stream.toString());
    } else {
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Upload Image'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                getImage();
              },
              child: Container(
                  child: image == null
                      ? const Center(child: Text('Pick Image'))
                      : SizedBox(
                          height: 400,
                          width: 400,
                          child: Center(
                              child: Image.file(File(image!.path).absolute)),
                        )),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(child: Text('Upload')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
