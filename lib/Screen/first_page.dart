import 'package:allcareapp/bloc/all_service/all_service_bloc.dart';
import 'package:allcareapp/model/AllServiceListResponseModel.dart';
import 'package:allcareapp/service/SampleService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _containerRequest() {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          BlocProvider.of<AllServiceBloc>(context).add(getAllService());
          Navigator.of(context).pushNamed('/secondPage');
        },
        child: Text("Get service"),
      ),
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

  Widget _containerLoaded(List<AllService> allServiceList) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: allServiceList.length,
        itemBuilder: (context, index) {
          return Container(
              child: Text("ID : " +
                  allServiceList[index].serviceID +
                  " Name : " +
                  allServiceList[index].serviceName));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("First Page"),
        ),
           body: _containerRequest(),
    ));
  }
}
