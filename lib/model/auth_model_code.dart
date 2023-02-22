class Modelcode {
  int? status;
  String? message;
  Null? externalId;

  Modelcode({this.status, this.message, this.externalId});

  Modelcode.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    externalId = json['externalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['externalId'] = this.externalId;
    return data;
  }
}
