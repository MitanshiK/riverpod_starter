// class user_info_model {
//   int? page;
//   int? per_page;
//   int? total;
//   int? total_pages;
//   List<DataModel>? data;
//   SupportModel? support;

//   user_info_model(
//       {this.page,
//       this.per_page,
//       this.total,
//       this.total_pages,
//       this.data,
//       this.support});

//   user_info_model.fromJson(Map<String, dynamic> json) {
//     page = json['page'];
//     per_page = json['per_page'];
//     total = json['total'];
//     total_pages = json['total_pages'];
//     if (json['data'] != null) {
//       data = <DataModel>[];
//       json['data'].forEach((v) {
//         data!.add(DataModel.fromJson(v));
//       });
//     }
//     support =
//         json['support'] != null ? SupportModel.fromJson(json['support']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['page'] = page;
//     data['per_page'] = per_page;
//     data['total'] = total;
//     data['total_pages'] = total_pages;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (support != null) {
//       data['support'] = support!.toJson();
//     }
//     return data;
//   }
// }

// DataModel
class DataModel {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  DataModel({this.id, this.email, this.first_name, this.last_name, this.avatar});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    avatar = json['avatar'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['avatar'] = avatar;
    return data;
  }
}

// support model
class SupportModel {
  String? url;
  String? text;

  SupportModel({this.url, this.text});

  SupportModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = url;
    data['text'] = text;
    return data;
  }
}
