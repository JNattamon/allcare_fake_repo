import 'package:allcareapp/bloc/all_service/all_service_bloc.dart';
import 'package:allcareapp/model/AllServiceListResponseModel.dart';
import 'package:allcareapp/service/SampleService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Widget _containerLoaded(List<AllService> allServiceList) {
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

  Widget _containerLoading() {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF03396C))),
    );
  }

  Widget _containerError() {
    return Container(
        alignment: Alignment.center,
        child: Text(
          "Error",
          style: TextStyle(color: Colors.red, fontSize: 30),
        ));
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
            child: BlocBuilder<AllServiceBloc, AllServiceState>(
              builder: (context, allServiceState) {
                if (allServiceState is LoadedAllServiceState) {
                  return _containerLoaded(allServiceState.allServiceList);
                } else if (allServiceState is LoadingAllServiceState) {
                  return _containerLoading();
                } else {
                  return _containerError();
                }
              },
            ),
          )),
    );
  }
}
