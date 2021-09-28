import 'package:allcareapp/model/AllServiceListResponseModel.dart';
import 'package:allcareapp/service/SampleService.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _stageLoaded(List<AllService> allServiceList) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: allServiceList.length,
      itemBuilder: (context, index) {
        return Container(
            child: Text("ID : " +
                allServiceList[index].serviceID +
                " Name : " +
                allServiceList[index].serviceName));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Second Page"),
          ),
          body: Container(

          )),
    );
  }
}
