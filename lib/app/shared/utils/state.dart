abstract class State {}

class Failure extends State {
  String? message;
  Failure(this.message);
}

class Success extends State {
  dynamic data;
  Success(this.data);
}
