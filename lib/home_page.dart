import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/abc.dart';
import 'package:getx/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(UserController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          return _controller.isLoading.value
              ? Center(
                  child: const CircularProgressIndicator(
                  color: Colors.black,
                ))
              : Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() {
                        return _controller.isDisplayed.value
                            ? Column(
                                children: [
                                  Container(
                                    color: Colors.purple,
                                    height: 100,
                                    width: 100,
                                  ),
                                  Container(
                                    color: Colors.yellow,
                                    height: 100,
                                    width: 100,
                                  ),
                                ],
                              )
                            : SizedBox();
                      }),
                      Text(_controller.user.value.title),
                      ElevatedButton(
                          onPressed: () {
                            _controller.isDisplayed.value = true;
                            Get.to(() => ABC(), arguments: {
                              'title': _controller.user.value.id.toString(),
                            });
                          },
                          child: Text(
                            "click me",
                          ))
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
