import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_test/view_models/selector_view_model.dart';
import 'package:dropdown_test/views/selected_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SelectorScreen extends StatefulWidget {
  const SelectorScreen({super.key});

  @override
  State<SelectorScreen> createState() => _SelectorScreenState();
}

class _SelectorScreenState extends State<SelectorScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SelectorViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("Country/State Selector")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              vm.isLoadingCountries
                  ? _loadingWidget()
                  : Container(
                      decoration: _boxDecoration(),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Text(
                            'Select Country',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          value: vm.selectedCountryKey,
                          items: vm.countries.map((country) {
                            return DropdownMenuItem<String>(
                              value: '${country.id}_${country.value}',
                              child: Text(
                                country.value,
                                style: const TextStyle(fontSize: 14),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) vm.selectCountry(value);
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 10),
                          ),
                          iconStyleData: _arrowIcon(),
                        ),
                      ),
                    ),
              const SizedBox(height: 16),
              vm.isLoadingStates
                  ? _loadingWidget()
                  : Container(
                      decoration: _boxDecoration(),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Text(
                            'Select State',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          value: vm.selectedStateId,
                          items: vm.states.map((state) {
                            return DropdownMenuItem<String>(
                              value: state.id,
                              child: Text(
                                state.value,
                                style: const TextStyle(fontSize: 14),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) vm.selectState(value);
                          },
                          iconStyleData: _arrowIcon(),
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 10),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed:
                      vm.selectedCountryId == null || vm.selectedStateId == null
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectedResultScreen(
                                    countryName: vm.selectedCountryKey!
                                        .split("_")
                                        .sublist(1)
                                        .join(),
                                    stateName: vm.selectedState!.value,
                                  ),
                                ),
                              );
                            },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(width: 1, color: Colors.grey),
      );

  Widget _loadingWidget() => Container(
        decoration: _boxDecoration(),
        padding: const EdgeInsets.all(6.0),
        child: const Center(child: CircularProgressIndicator(strokeWidth: 3.0)),
      );

  IconStyleData _arrowIcon() => IconStyleData(
        icon: SvgPicture.asset(
          'assets/icons/ic_arrow_down.svg',
          colorFilter: const ColorFilter.mode(Colors.black38, BlendMode.srcIn),
        ),
      );
}
