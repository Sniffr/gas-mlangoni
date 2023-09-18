import 'package:mlangoni/data/model/response/language_model.dart';
import 'package:mlangoni/util/app_constants.dart';
import 'package:flutter/material.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext context}) {
    return AppConstants.languages;
  }
}
