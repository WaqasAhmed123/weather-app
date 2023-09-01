import 'package:geolocator/geolocator.dart';

class UserModel {
  static String? lat;
  static String? lng;


  static _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle the case when the userInstance has permanently denied
      // permission to access their location.
      return false;
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  static getCurrentLocation() async {
    bool locationGranted = await _requestLocationPermission();

    if (locationGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        UserModel.lat = position.latitude.toString();
        UserModel.lng = position.longitude.toString();
        print(UserModel.lat);
        print(UserModel.lng);
      } catch (e) {
        print(e);
      }
    }
  }
}
