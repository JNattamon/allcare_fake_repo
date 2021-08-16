class SampleCheckBoxModel {
  int id;
  String name;
  bool isSelected;

  SampleCheckBoxModel({this.id, this.name, this.isSelected});

  SampleCheckBoxModel.fromJson(Map<String, dynamic> json) {
    id = json['skillId'];
    name = json['skillName'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skillId'] = this.id;
    data['skillName'] = this.name;
    data['skillName'] = this.isSelected;
    return data;
  }
}
