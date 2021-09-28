class AllServiceListResponseModel {
  String statusCode;
  String statusMessage;
  List<AllService> result;

  AllServiceListResponseModel({this.statusCode, this.statusMessage, this.result});

  AllServiceListResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    if (json['result'] != null) {
      result = new List<AllService>();
      json['result'].forEach((v) {
        result.add(new AllService.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['statusMessage'] = this.statusMessage;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllService {
  String serviceID;
  String serviceName;

  AllService({this.serviceID, this.serviceName});

  AllService.fromJson(Map<String, dynamic> json) {
    serviceID = json['Service_ID'];
    serviceName = json['Service_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Service_ID'] = this.serviceID;
    data['Service_Name'] = this.serviceName;
    return data;
  }
}
