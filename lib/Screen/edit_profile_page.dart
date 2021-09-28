import 'dart:io';
import 'package:allcareapp/model/AllServiceListResponseModel.dart';
import 'package:allcareapp/model/SampleCheckBoxModel.dart';
import 'package:allcareapp/model/TransDetailModel.dart';
import 'package:allcareapp/service/SampleService.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File imageFile;
  String imageFileTemp;

  TextEditingController telTextController =
      TextEditingController(text: '+66-XXX-XXXX');
  TextEditingController mailTextController =
      TextEditingController(text: 'XXXXXXX@gosoft.co.th');
  TextEditingController addressTextController = TextEditingController(
      text:
          'xx/xxxx ซ.xxxxx ถนน \nxxxxxxxx แขวง xxxxxxxxx\nจังหวัด xxxxxxx xxxxxxx');

  List<SampleCheckBoxModel> skillList = [
    SampleCheckBoxModel(id: 1, name: "ซ่อม", isSelected: false),
    SampleCheckBoxModel(id: 2, name: "ล้าง", isSelected: false),
  ];

  List<SampleCheckBoxModel> areaList = [
    SampleCheckBoxModel(id: 1, name: "กรุงเทพเหนือ", isSelected: false),
    SampleCheckBoxModel(id: 2, name: "กรุงเทพใต้", isSelected: false),
    SampleCheckBoxModel(id: 3, name: "นนทบุรี", isSelected: false),
    SampleCheckBoxModel(id: 4, name: "ปทุมธานี", isSelected: false)
  ];

  List<SampleCheckBoxModel> workDayList = [
    SampleCheckBoxModel(id: 1, name: "จ.", isSelected: false),
    SampleCheckBoxModel(id: 2, name: "อ.", isSelected: false),
    SampleCheckBoxModel(id: 3, name: "พ.", isSelected: false),
    SampleCheckBoxModel(id: 4, name: "พฤ.", isSelected: false),
    SampleCheckBoxModel(id: 5, name: "ศ.", isSelected: false),
    SampleCheckBoxModel(id: 6, name: "ส.", isSelected: false),
    SampleCheckBoxModel(id: 7, name: "อา.", isSelected: false),
  ];

  Future getImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    setState(() {
      imageFile = File(pickedFile.path);
      imageFileTemp = pickedFile.path;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget sampleCheckBoxSet(List<SampleCheckBoxModel> checkBoxList) {
    return Column(
      children: [
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: checkBoxList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 3),
            itemBuilder: (BuildContext context, int index) => Container(
              child: GestureDetector(
                child: Row(
                  children: [
                    Checkbox(
                      value: checkBoxList[index].isSelected,
                      onChanged: (value) {
                        setState(() {
                          checkBoxList[index].isSelected = value;
                        });
                      },
                      activeColor: Colors.indigo,
                    ),
                    Text(
                      checkBoxList[index].name,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _postBookDetail() async{
    SampleService sampleService = new SampleService();
    transDetailMessage mockUpBody = transDetailMessage(statusMessage: "000", statusCode: "000", result: TransDetailResult());
    List<AllService> allService = await sampleService.getBookingService(mockUpBody);
    print(allService[0].serviceID + "(" +  allService[0].serviceName + ")");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("All Care"),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                width: 100,
                height: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: null == imageFile
                          ? Image(image: AssetImage("images/user.png"))
                          : Image.file(
                        imageFile,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    GestureDetector(
                      onTap: _postBookDetail,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt),
                          iconSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "ชื่อจริง XXXXXX นามสกุล XXXXXXX",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: telTextController,
                    decoration: InputDecoration(border: UnderlineInputBorder()),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: mailTextController,
                    decoration: InputDecoration(border: UnderlineInputBorder()),
                  )),
              Container(
                margin: EdgeInsets.only(top: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Address',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    controller: addressTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(
                        'Skill',
                        style: TextStyle(fontSize: 16),
                      )),
                  Expanded(child: sampleCheckBoxSet(skillList))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(
                        'Area',
                        style: TextStyle(fontSize: 16),
                      )),
                  Expanded(child: sampleCheckBoxSet(areaList))
                ],
              ),
              Container(
                  alignment: Alignment.centerLeft, child: Text("Working Day")),
              sampleCheckBoxSet(workDayList)
            ],
          ),
        ),
      ),
    );
  }
}
