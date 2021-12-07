abstract class AppState {}

class InationalState extends AppState {}

class GetAzkerLoding extends AppState {}

class GetAzkerScasses extends AppState {}

class GetAzkerError extends AppState {
  final String error;

  GetAzkerError(this.error);
}

class GetsouraLoding extends AppState {}

class GetsouraScasses extends AppState {}

class GetsouraError extends AppState {
  final String error;

  GetsouraError(this.error);
}
