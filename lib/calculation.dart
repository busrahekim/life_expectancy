import 'package:life_expectancy/user_data.dart';

class Calculation {
  UserData _userData;
  Calculation(this._userData);

  int calculate() {
    double result;

    result = 90 + _userData.sport - _userData.smoke;
    result = result + (_userData.height / _userData.weight);

    result =
        _userData.selectedSexuality == 'WOMAN' ? result = result + 3 : result;
    return result.toInt();
  }
}
