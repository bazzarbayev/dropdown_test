import 'package:collection/collection.dart';
import 'package:dropdown_test/models/country.dart';
import 'package:dropdown_test/models/state.dart';
import 'package:dropdown_test/services/selector_service.dart';
import 'package:flutter/material.dart';

class SelectorViewModel extends ChangeNotifier {
  final SelectorService _service;

  SelectorViewModel(this._service);

  bool _isLoadingCountries = false;
  bool get isLoadingCountries => _isLoadingCountries;

  bool _isLoadingStates = false;
  bool get isLoadingStates => _isLoadingStates;

  List<Country> _countries = [];
  List<Country> get countries => _countries;

  List<StateModel> _states = [];
  List<StateModel> get states => _states;

  String? _selectedCountryKey;
  String? get selectedCountryKey => _selectedCountryKey;

  String? _selectedCountryId;
  String? get selectedCountryId => _selectedCountryId;

  String? _selectedCountryName;
  String? get selectedCountryName => _selectedCountryName;

  String? _selectedStateId;
  String? get selectedStateId => _selectedStateId;

  Country? get selectedCountry =>
      _countries.firstWhereOrNull((c) => c.id == _selectedCountryId);

  StateModel? get selectedState =>
      _states.firstWhereOrNull((s) => s.id == _selectedStateId);

  Future<void> getCountries() async {
    _isLoadingCountries = true;
    notifyListeners();

    _countries = await _service.fetchCountries();

    _isLoadingCountries = false;
    notifyListeners();
  }

  Future<void> getStates(String countryId) async {
    _isLoadingStates = true;
    _states = [];
    _selectedStateId = null;
    notifyListeners();

    _states = await _service.fetchStates(countryId);

    _isLoadingStates = false;
    notifyListeners();
  }

  void selectCountry(String countryKey) {
    _selectedCountryKey = countryKey;
    final parts = countryKey.split("_");
    _selectedCountryId = parts[0];
    notifyListeners();

    getStates(_selectedCountryId!);
  }

  void selectState(String stateId) {
    _selectedStateId = stateId;
    notifyListeners();
  }
}
