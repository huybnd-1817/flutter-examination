import 'package:flutter_examination/di/network_providers.dart';
import 'package:flutter_examination/di/repository_providers.dart';
import 'package:flutter_examination/di/view_model_providers.dart';

final appProviders = [
  ...networkProviders,
  ...repositoryProviders,
  ...viewModelProviders,
];