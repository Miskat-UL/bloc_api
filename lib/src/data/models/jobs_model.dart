class Jobs {
  String? statuscode;
  String? message;
  List<Data>? data;
  Common? common;

  Jobs({this.statuscode, this.message, this.data, this.common});

  Jobs.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    common =
        json['common'] != null ? new Common.fromJson(json['common']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = this.statuscode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.common != null) {
      data['common'] = this.common!.toJson();
    }
    return data;
  }
}

class Data {
  String? jobTitle;
  String? deadline;
  String? recruitingCompanySProfile;
  JobDetails? jobDetails;
  String? logo;
  bool? isFeatured;
  int? minExperience;
  int? maxExperience;
  String? minSalary;
  String? maxSalary;

  Data(
      {this.jobTitle,
      this.deadline,
      this.recruitingCompanySProfile,
      this.jobDetails,
      this.logo,
      this.isFeatured,
      this.minExperience,
      this.maxExperience,
      this.minSalary,
      this.maxSalary});

  Data.fromJson(Map<String, dynamic> json) {
    jobTitle = json['jobTitle'];
    deadline = json['deadline'];
    recruitingCompanySProfile = json["recruitingCompany'sProfile"];
    jobDetails = json['jobDetails'] != null
        ? new JobDetails.fromJson(json['jobDetails'])
        : null;
    logo = json['logo'];
    isFeatured = json['IsFeatured'];
    minExperience = json['minExperience'];
    maxExperience = json['maxExperience'];
    minSalary = json['minSalary'];
    maxSalary = json['maxSalary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobTitle'] = this.jobTitle;
    data['deadline'] = this.deadline;
    data["recruitingCompany'sProfile"] = this.recruitingCompanySProfile;
    if (this.jobDetails != null) {
      data['jobDetails'] = this.jobDetails!.toJson();
    }
    data['logo'] = this.logo;
    data['IsFeatured'] = this.isFeatured;
    data['minExperience'] = this.minExperience;
    data['maxExperience'] = this.maxExperience;
    data['minSalary'] = this.minSalary;
    data['maxSalary'] = this.maxSalary;
    return data;
  }
}

class JobDetails {
  String? title;
  String? lastDate;
  String? companyName;
  String? applyInstruction;

  JobDetails(
      {this.title, this.lastDate, this.companyName, this.applyInstruction});

  JobDetails.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    lastDate = json['LastDate'];
    companyName = json['CompanyName'];
    applyInstruction = json['ApplyInstruction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['LastDate'] = this.lastDate;
    data['CompanyName'] = this.companyName;
    data['ApplyInstruction'] = this.applyInstruction;
    return data;
  }
}

class Common {
  int? totalRecordsFound;
  int? totalpages;

  Common({this.totalRecordsFound, this.totalpages});

  Common.fromJson(Map<String, dynamic> json) {
    totalRecordsFound = json['total_records_found'];
    totalpages = json['totalpages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_records_found'] = this.totalRecordsFound;
    data['totalpages'] = this.totalpages;
    return data;
  }
}
