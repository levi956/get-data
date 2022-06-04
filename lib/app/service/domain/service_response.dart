class ServiceResponse<T> {
  String? message;
  T? data;
  bool? status;

  ServiceResponse({this.data, this.message, this.status});
}
