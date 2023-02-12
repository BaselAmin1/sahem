import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sahem_app/features/profile/data/models/user_model.dart';
import 'package:sahem_app/features/profile/data/web_services/profile_web_services.dart';
import 'package:sahem_app/features/profile/presentation/widgets/show_dialog.dart';
import 'package:sahem_app/helper/constants/strings.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:dio/dio.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  String? imgId;

  //String id = CacheHelper.getData(key: 'kId');

  Future getUser() async {
    emit(GetUserLoadingState());
    try {
      await ProfileWebServices.getUserByToken(
        url: kUserEndPoint,
      ).then((value) {
        kUser = UserModel.fromJson(value.data);

        print(value.data.toString());
        emit(GetUserSuccessState());
      });
    } catch (e) {
      emit(GetUserErrorState(e.toString()));
      print(e.toString());
    }
  }

  Future checkLocationPermission({context}) async {
    bool services;
    LocationPermission permission;
    services = await Geolocator.isLocationServiceEnabled();

    if (services == false) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialogFb1(
              title: "تنبيه",
              description: "يرجي تفعيل خدمات الموقع",
              actions: []));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        getLocation();
      }
    }
  }

  Future<Position> getLatAndLong() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  Future<List<Placemark>> getLocation() async {
    emit(GetLocationLoadingState());
    try {
      kC1 = await getLatAndLong();
      print(kC1!.latitude);
      kPlacemarks =
          await placemarkFromCoordinates(kC1!.latitude, kC1!.longitude);
      emit(GetLocationSuccessState());
    } catch (e) {
      emit(GetLocationErrorState(e.toString()));
      print(e.toString());
    }
    return kPlacemarks!;
  }

  Future<void> pickImageFromGallery() async {
    emit(PickImageLoadingState());
    final ImagePicker picker = ImagePicker();
    try {
      PickedFile? pickedFile = await picker.getImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        kPickedImage = File(pickedFile.path);
        emit(PickImageGallerySuccessState());
      }
    } catch (e) {
      emit(PickImageErrorState(e.toString()));
      print(e.toString());
    }
  }

  Future<void> pickImageFromCamera() async {
    emit(PickImageLoadingState());
    final ImagePicker picker = ImagePicker();
    try {
      PickedFile? pickedFile = await picker.getImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        kPickedImage = File(pickedFile.path);
        emit(PickImageCameraSuccessState());
      }
    } catch (e) {
      emit(PickImageErrorState(e.toString()));
      print(e.toString());
    }
  }

  Future<void> getDate() async {
    initializeDateFormatting("ar_EG", null).then((_) {
      var now = DateTime.now();
      var formatter = DateFormat.yMMMd('ar_EG');
      print(formatter.locale);
      kFormattedDate = formatter.format(now);
      print(kFormattedDate);
      return kFormattedDate;
    });
  }

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility;

  void changeBotooms1() {
    kB1 = 1;
    emit(ChangeBottomState());
  }

  void changeBotooms2() {
    kB1 = 2;
    emit(ChangeBottomState());
  }

  void changeBotooms3() {
    kB2 = 1;
    emit(ChangeBottomState());
  }

  void changeBotooms4() {
    kB2 = 2;
    emit(ChangeBottomState());
  }

  Future sendReport(
    File file,
    String title,
    String description,
    String location,
    bool isEmergency,
    bool hasPreviousComplaint,
  ) async {
    emit(SendReportLoadingState());
    String fileName = file.path.split('/').last;
    print(fileName);
    FormData data = FormData.fromMap({
      'title': title,
      'description': description,
      'image': await MultipartFile.fromFile(file.path, filename: fileName),
      'location': location,
      'isEmergency': isEmergency,
      'hasPreviousComplaint': hasPreviousComplaint,
    });
    print(data);
    try {
      await ProfileWebServices.postReport(
        url: kReportEndPoint,
        data: data,
      ).then((value) {
        imgId = value.data['id'];
        print(value.data.toString());
        emit(SendReportSuccessState());
      });
    } catch (error) {
      print(error.toString());
      emit(SendReportErrorState(error.toString()));
    }
  }
}
