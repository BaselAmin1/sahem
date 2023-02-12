class UserModel {
  Result? result;
  int? statusCode;


  UserModel({this.result, this.statusCode});

  UserModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    statusCode = json['statusCode'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['statusCode'] = this.statusCode;
    
    return data;
  }
}

class Result {
  String? sId;
  String? name;
  String? phone;
  String? role;

  Result({this.sId, this.name, this.phone, this.role});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['role'] = this.role;
    return data;
  }
}