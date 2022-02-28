import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart' as blocs;
import '../utils/utils.dart' as utils;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<blocs.ThemeBloc>(context).add(
      const blocs.GetThemeEvent(),
    );
    BlocProvider.of<blocs.MellopadBloc>(context).add(
      const blocs.GetMellopadDataEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<blocs.MellopadBloc, blocs.MellopadState>(
      listener: (airQualityContext, airQualityState) {
        if (airQualityState is blocs.FailedToGetMellopadState) {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(
                utils.padding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.warning,
                    color: Colors.red,
                    size: utils.largePadding + utils.padding,
                  ),
                  SizedBox(
                    height: utils.padding,
                  ),
                  Text(
                    utils.anErrorOccurred,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: utils.padding,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
      child: BlocBuilder<blocs.ThemeBloc, blocs.ThemeState>(
        builder: (themeContext, themeState) {
          return BlocBuilder<blocs.MellopadBloc, blocs.MellopadState>(
            builder: (airQualityContext, airQualityState) => Scaffold(
              appBar: AppBar(
                title: Text(
                  utils.pyloop,
                  style: TextStyle(
                    color: themeState.themeValue == utils.Theme.dark
                        ? Colors.white
                        : utils.lightModeBaseColor,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                    ),
                    onPressed: () {
                      BlocProvider.of<blocs.MellopadBloc>(context).add(
                        const blocs.GetMellopadDataEvent(),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        utils.settingsScreenRoute,
                      );
                    },
                  ),
                ],
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: utils.padding,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: utils.extraLargePadding,
                                  height: utils.extraLargePadding,
                                  child: CircularProgressIndicator(
                                    value: airQualityState
                                            is blocs.GotAirQualityState
                                        ? (airQualityState.airQuality.pMOne /
                                            utils.fiveHundred.toDouble())
                                        : airQualityState is blocs
                                                .FailedToGetAirQualityState
                                            ? utils.hundred.toDouble()
                                            : null,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      themeState.themeValue == utils.Theme.dark
                                          ? Colors.white
                                          : utils.lightModeBaseColor,
                                    ),
                                  ),
                                ),
                                airQualityState
                                        is blocs.FailedToGetAirQualityState
                                    ? Text(
                                        utils.exclamation,
                                        style: TextStyle(
                                          color: themeState.themeValue ==
                                                  utils.Theme.dark
                                              ? Colors.white
                                              : utils.lightModeBaseColor,
                                          fontSize: utils.largePadding +
                                              utils.padding,
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          airQualityState
                                                  is blocs.GotAirQualityState
                                              ? Text(
                                                  utils.pMOne.toUpperCase(),
                                                  style: TextStyle(
                                                    color: themeState
                                                                .themeValue ==
                                                            utils.Theme.dark
                                                        ? Colors.white
                                                        : utils
                                                            .lightModeBaseColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  width: utils.nil,
                                                  height: utils.nil,
                                                ),
                                          Text(
                                            airQualityState
                                                    is blocs.GotAirQualityState
                                                ? (airQualityState
                                                        .airQuality.pMOne)
                                                    .toString()
                                                : utils.threeDots,
                                            style: TextStyle(
                                              fontSize: utils.largePadding,
                                              color: themeState.themeValue ==
                                                      utils.Theme.dark
                                                  ? Colors.white
                                                  : utils.lightModeBaseColor,
                                            ),
                                          ),
                                          airQualityState
                                                  is blocs.GotAirQualityState
                                              ? Text(
                                                  utils.ofFiveHundred,
                                                  style: TextStyle(
                                                    color: themeState
                                                                .themeValue ==
                                                            utils.Theme.dark
                                                        ? Colors.white
                                                        : utils
                                                            .lightModeBaseColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  width: utils.nil,
                                                  height: utils.nil,
                                                ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: utils.extraLargePadding,
                                  height: utils.extraLargePadding,
                                  child: CircularProgressIndicator(
                                    value: airQualityState
                                            is blocs.GotAirQualityState
                                        ? (airQualityState
                                                .airQuality.temperature /
                                            utils.hundred.toDouble())
                                        : airQualityState is blocs
                                                .FailedToGetAirQualityState
                                            ? utils.hundred.toDouble()
                                            : null,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      themeState.themeValue == utils.Theme.dark
                                          ? Colors.white
                                          : utils.lightModeBaseColor,
                                    ),
                                  ),
                                ),
                                airQualityState
                                        is blocs.FailedToGetAirQualityState
                                    ? Text(
                                        utils.exclamation,
                                        style: TextStyle(
                                          color: themeState.themeValue ==
                                                  utils.Theme.dark
                                              ? Colors.white
                                              : utils.lightModeBaseColor,
                                          fontSize: utils.largePadding +
                                              utils.padding,
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          airQualityState
                                                  is blocs.GotAirQualityState
                                              ? Text(
                                                  utils.temperature
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    color: themeState
                                                                .themeValue ==
                                                            utils.Theme.dark
                                                        ? Colors.white
                                                        : utils
                                                            .lightModeBaseColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  width: utils.nil,
                                                  height: utils.nil,
                                                ),
                                          Text(
                                            airQualityState
                                                    is blocs.GotAirQualityState
                                                ? (airQualityState
                                                        .airQuality.temperature)
                                                    .toString()
                                                : utils.threeDots,
                                            style: TextStyle(
                                              fontSize: utils.largePadding,
                                              color: themeState.themeValue ==
                                                      utils.Theme.dark
                                                  ? Colors.white
                                                  : utils.lightModeBaseColor,
                                            ),
                                          ),
                                          airQualityState
                                                  is blocs.GotAirQualityState
                                              ? Text(
                                                  utils.ofHundred,
                                                  style: TextStyle(
                                                    color: themeState
                                                                .themeValue ==
                                                            utils.Theme.dark
                                                        ? Colors.white
                                                        : utils
                                                            .lightModeBaseColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  width: utils.nil,
                                                  height: utils.nil,
                                                ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: utils.largePadding,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: utils.extraLargePadding +
                                utils.extraLargePadding +
                                utils.veryLargePadding,
                            height: utils.extraLargePadding +
                                utils.extraLargePadding +
                                utils.veryLargePadding,
                            child: CircularProgressIndicator(
                              value: airQualityState is blocs.GotAirQualityState
                                  ? (airQualityState.airQuality.pMTwoPointFive /
                                      utils.fiveHundred.toDouble())
                                  : airQualityState
                                          is blocs.FailedToGetAirQualityState
                                      ? utils.hundred.toDouble()
                                      : null,
                              valueColor: airQualityState
                                      is blocs.GotAirQualityState
                                  ? AlwaysStoppedAnimation<Color>(
                                      _pMTwoPointFiveColor(
                                          pMTwoPointFiveValue: airQualityState
                                              .airQuality.pMTwoPointFive),
                                    )
                                  : AlwaysStoppedAnimation<Color>(
                                      themeState.themeValue == utils.Theme.dark
                                          ? Colors.white
                                          : utils.lightModeBaseColor,
                                    ),
                            ),
                          ),
                          airQualityState is blocs.FailedToGetAirQualityState
                              ? IconButton(
                                  splashRadius: utils.veryLargePadding,
                                  icon: Icon(
                                    Icons.refresh,
                                    size: utils.largePadding + utils.padding,
                                    color: themeState.themeValue ==
                                            utils.Theme.dark
                                        ? Colors.white
                                        : utils.lightModeBaseColor,
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<blocs.MellopadBloc>(context)
                                        .add(
                                      const blocs.GetAirQualityEvent(),
                                    );
                                  },
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    airQualityState is blocs.GotAirQualityState
                                        ? Text(
                                            utils.pMTwoPointFive.toUpperCase(),
                                            style: TextStyle(
                                              fontSize: utils.padding +
                                                  utils.smallPadding,
                                              color: themeState.themeValue ==
                                                      utils.Theme.dark
                                                  ? Colors.white
                                                  : utils.lightModeBaseColor,
                                            ),
                                          )
                                        : const SizedBox(
                                            width: utils.nil,
                                            height: utils.nil,
                                          ),
                                    Text(
                                      airQualityState
                                              is blocs.GotAirQualityState
                                          ? (airQualityState
                                                  .airQuality.pMTwoPointFive)
                                              .toString()
                                          : utils.threeDots,
                                      style: TextStyle(
                                        fontSize: utils.extraLargePadding,
                                        color: airQualityState
                                                is blocs.GotAirQualityState
                                            ? _pMTwoPointFiveColor(
                                                pMTwoPointFiveValue:
                                                    airQualityState.airQuality
                                                        .pMTwoPointFive)
                                            : themeState.themeValue ==
                                                    utils.Theme.dark
                                                ? Colors.white
                                                : utils.lightModeBaseColor,
                                      ),
                                    ),
                                    airQualityState is blocs.GotAirQualityState
                                        ? Text(
                                            utils.ofFiveHundred,
                                            style: TextStyle(
                                              fontSize: utils.padding +
                                                  utils.smallPadding,
                                              color: themeState.themeValue ==
                                                      utils.Theme.dark
                                                  ? Colors.white
                                                  : utils.lightModeBaseColor,
                                            ),
                                          )
                                        : const SizedBox(
                                            width: utils.nil,
                                            height: utils.nil,
                                          ),
                                    airQualityState is blocs.GotAirQualityState
                                        ? Text(
                                            _pMTwoPointFiveRemark(
                                              pMTwoPointFiveValue:
                                                  airQualityState.airQuality
                                                      .pMTwoPointFive,
                                            ).toUpperCase(),
                                            style: TextStyle(
                                              fontSize: utils.padding +
                                                  utils.smallPadding,
                                              color: _pMTwoPointFiveColor(
                                                  pMTwoPointFiveValue:
                                                      airQualityState.airQuality
                                                          .pMTwoPointFive),
                                            ),
                                          )
                                        : const SizedBox(
                                            width: utils.nil,
                                            height: utils.nil,
                                          ),
                                  ],
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: utils.largePadding,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: utils.extraLargePadding,
                                  height: utils.extraLargePadding,
                                  child: CircularProgressIndicator(
                                    value: airQualityState
                                            is blocs.GotAirQualityState
                                        ? (airQualityState.airQuality.pMTen /
                                            utils.fiveHundred.toDouble())
                                        : airQualityState is blocs
                                                .FailedToGetAirQualityState
                                            ? utils.hundred.toDouble()
                                            : null,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      themeState.themeValue == utils.Theme.dark
                                          ? Colors.white
                                          : utils.lightModeBaseColor,
                                    ),
                                  ),
                                ),
                                airQualityState
                                        is blocs.FailedToGetAirQualityState
                                    ? Text(
                                        utils.exclamation,
                                        style: TextStyle(
                                          color: themeState.themeValue ==
                                                  utils.Theme.dark
                                              ? Colors.white
                                              : utils.lightModeBaseColor,
                                          fontSize: utils.largePadding +
                                              utils.padding,
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          airQualityState
                                                  is blocs.GotAirQualityState
                                              ? Text(
                                                  utils.pMTen.toUpperCase(),
                                                  style: TextStyle(
                                                    color: themeState
                                                                .themeValue ==
                                                            utils.Theme.dark
                                                        ? Colors.white
                                                        : utils
                                                            .lightModeBaseColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  width: utils.nil,
                                                  height: utils.nil,
                                                ),
                                          Text(
                                            airQualityState
                                                    is blocs.GotAirQualityState
                                                ? (airQualityState
                                                        .airQuality.pMTen)
                                                    .toString()
                                                : utils.threeDots,
                                            style: TextStyle(
                                              fontSize: utils.largePadding,
                                              color: themeState.themeValue ==
                                                      utils.Theme.dark
                                                  ? Colors.white
                                                  : utils.lightModeBaseColor,
                                            ),
                                          ),
                                          airQualityState
                                                  is blocs.GotAirQualityState
                                              ? Text(
                                                  utils.ofFiveHundred,
                                                  style: TextStyle(
                                                    color: themeState
                                                                .themeValue ==
                                                            utils.Theme.dark
                                                        ? Colors.white
                                                        : utils
                                                            .lightModeBaseColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  width: utils.nil,
                                                  height: utils.nil,
                                                ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: utils.extraLargePadding,
                                  height: utils.extraLargePadding,
                                  child: CircularProgressIndicator(
                                    value: airQualityState
                                            is blocs.GotAirQualityState
                                        ? (airQualityState.airQuality.humidity /
                                            utils.hundred.toDouble())
                                        : airQualityState is blocs
                                                .FailedToGetAirQualityState
                                            ? utils.hundred.toDouble()
                                            : null,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      themeState.themeValue == utils.Theme.dark
                                          ? Colors.white
                                          : utils.lightModeBaseColor,
                                    ),
                                  ),
                                ),
                                airQualityState
                                        is blocs.FailedToGetAirQualityState
                                    ? Text(
                                        utils.exclamation,
                                        style: TextStyle(
                                          color: themeState.themeValue ==
                                                  utils.Theme.dark
                                              ? Colors.white
                                              : utils.lightModeBaseColor,
                                          fontSize: utils.largePadding +
                                              utils.padding,
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          airQualityState
                                                  is blocs.GotAirQualityState
                                              ? Text(
                                                  utils.humidity.toUpperCase(),
                                                  style: TextStyle(
                                                    color: themeState
                                                                .themeValue ==
                                                            utils.Theme.dark
                                                        ? Colors.white
                                                        : utils
                                                            .lightModeBaseColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  width: utils.nil,
                                                  height: utils.nil,
                                                ),
                                          Text(
                                            airQualityState
                                                    is blocs.GotAirQualityState
                                                ? (airQualityState
                                                        .airQuality.humidity)
                                                    .toString()
                                                : utils.threeDots,
                                            style: TextStyle(
                                              fontSize: utils.largePadding,
                                              color: themeState.themeValue ==
                                                      utils.Theme.dark
                                                  ? Colors.white
                                                  : utils.lightModeBaseColor,
                                            ),
                                          ),
                                          airQualityState
                                                  is blocs.GotAirQualityState
                                              ? Text(
                                                  utils.ofHundred,
                                                  style: TextStyle(
                                                    color: themeState
                                                                .themeValue ==
                                                            utils.Theme.dark
                                                        ? Colors.white
                                                        : utils
                                                            .lightModeBaseColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  width: utils.nil,
                                                  height: utils.nil,
                                                ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: utils.padding,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _pMTwoPointFiveColor({required double pMTwoPointFiveValue}) {
    if (pMTwoPointFiveValue >= 0 && pMTwoPointFiveValue < 30) {
      return utils.goodColor;
    } else if (pMTwoPointFiveValue >= 30 && pMTwoPointFiveValue < 60) {
      return utils.satisfactoryColor;
    } else if (pMTwoPointFiveValue >= 60 && pMTwoPointFiveValue < 90) {
      return utils.moderateColor;
    } else if (pMTwoPointFiveValue >= 90 && pMTwoPointFiveValue < 120) {
      return utils.poorColor;
    } else if (pMTwoPointFiveValue >= 120 && pMTwoPointFiveValue < 250) {
      return utils.veryPoorColor;
    } else {
      return utils.severeColor;
    }
  }

  String _pMTwoPointFiveRemark({required double pMTwoPointFiveValue}) {
    if (pMTwoPointFiveValue >= 0 && pMTwoPointFiveValue < 30) {
      return utils.good;
    } else if (pMTwoPointFiveValue >= 30 && pMTwoPointFiveValue < 60) {
      return utils.satisfactory;
    } else if (pMTwoPointFiveValue >= 60 && pMTwoPointFiveValue < 90) {
      return utils.moderate;
    } else if (pMTwoPointFiveValue >= 90 && pMTwoPointFiveValue < 120) {
      return utils.poor;
    } else if (pMTwoPointFiveValue >= 120 && pMTwoPointFiveValue < 250) {
      return utils.veryPoor;
    } else {
      return utils.severe;
    }
  }
}
