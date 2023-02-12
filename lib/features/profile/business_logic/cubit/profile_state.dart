part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetUserLoadingState extends ProfileState {}
class GetUserSuccessState extends ProfileState {}
class GetUserErrorState extends ProfileState {
  final String error;
  GetUserErrorState(this.error);
}


class GetLocationLoadingState extends ProfileState {}
class GetLocationSuccessState extends ProfileState {}
class GetLocationErrorState extends ProfileState {
  final String error;
  GetLocationErrorState(this.error);
}

class PickImageLoadingState extends ProfileState {}
class PickImageGallerySuccessState extends ProfileState {}
class PickImageCameraSuccessState extends ProfileState {}
class PickImageErrorState extends ProfileState {
  final String error;
  PickImageErrorState(this.error);
}

class ChangeBottomState extends ProfileState {}

// class PutUserInitial extends ProfileState {}

// class PutUserLoadingState extends ProfileState {}

// class PutUserSuccessState extends ProfileState {}

// class PutUserErrorState extends ProfileState {
//   final String error;

//   PutUserErrorState(this.error);
// }




class SendReportLoadingState extends ProfileState {}
class SendReportSuccessState extends ProfileState {}
class SendReportErrorState extends ProfileState {
   final String error;

  SendReportErrorState(this.error);
}

// class GetImageState extends ProfileState {}



