import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sahem_app/features/profile/data/models/user_model.dart';

const kBaseUrl = 'https://road-safety-api.up.railway.app/api/';
const kRegisterEndPoint = 'auth/register';
const kLoginEndPoint = 'auth/login';
const kUserEndPoint = 'users/user-info';
const kReportEndPoint = 'complaints/createOne';
//String? kToken;
String? kToken;
//= 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6Ijk3MGI3ODY0LTcyZGUtNDY2Mi04ZGRiLTAwNDY4MjZjNTlmNiIsImlhdCI6MTY3NjEyNDI5MiwiZXhwIjoxNjc3NDIwMjkyfQ.ah8sUsOvGDMAdyiNzl2o0nUyuRZi-FVupyyoWlM8SFg';

String? kFormattedDate;
List<Placemark>? kPlacemarks;
File? kPickedImage;
String? kProblem;
Position? kC1;
int kB1= 0;
int kB2 = 0;
UserModel kUser = UserModel();
