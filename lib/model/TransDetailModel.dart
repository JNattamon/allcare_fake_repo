class transDetailMessage {
  String statusCode;
  String statusMessage;
  TransDetailResult result;

  transDetailMessage({this.statusCode, this.statusMessage, this.result});

  transDetailMessage.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    result =
    json['result'] != null ? new TransDetailResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['statusMessage'] = this.statusMessage;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class TransDetailResult {
  String transportationId;
  String status;
  String companyCode;
  String serviceCode;
  String orderNo;
  String orderId;
  String requestType;
  String requestDateTime;
  String updateDateTime;

  TransDetailResult(
      {this.transportationId,
        this.status,
        this.companyCode,
        this.serviceCode,
        this.orderNo,
        this.orderId,
        this.requestType,
        this.requestDateTime,
        this.updateDateTime});

  TransDetailResult.fromJson(Map<String, dynamic> json) {
    transportationId = json['transportationId'];
    status = json['status'];
    companyCode = json['companyCode'];
    serviceCode = json['serviceCode'];
    orderNo = json['orderNo'];
    orderId = json['orderId'];
    requestType = json['requestType'];
    requestDateTime = json['requestDateTime'];
    updateDateTime = json['updateDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transportationId'] = this.transportationId;
    data['status'] = this.status;
    data['companyCode'] = this.companyCode;
    data['serviceCode'] = this.serviceCode;
    data['orderNo'] = this.orderNo;
    data['orderId'] = this.orderId;
    data['requestType'] = this.requestType;
    data['requestDateTime'] = this.requestDateTime;
    data['updateDateTime'] = this.updateDateTime;
    return data;
  }
}
