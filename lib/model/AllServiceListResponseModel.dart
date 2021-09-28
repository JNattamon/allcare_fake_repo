class AllServiceResponse {
  Status status;
  List<AllService> data;

  AllServiceResponse({this.status, this.data});

  AllServiceResponse.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = new List<AllService>();
      json['data'].forEach((v) {
        data.add(new AllService.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String code;
  String message;

  Status({this.code, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
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
