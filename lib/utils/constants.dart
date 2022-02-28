import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// endpoints
const baseUrl = 'https://api.thingspeak.com';
final path =
    '/channels/${dotenv.env['CHANNEL_ID']}/feeds.json?api_key=${dotenv.env['API_KEY']!}&results=1';

// routes
const homeScreenRoute = '/homeScreen';
const settingsScreenRoute = '/settingsScreen';

// padding and margin
const extraLargePadding = 128.0;
const veryLargePadding = 64.0;
const largePadding = 32.0;
const padding = 16.0;
const smallPadding = 8.0;
const nil = 0.0;

const hundred = 100;
const fiveHundred = 500;

const lightModeBaseColor = Colors.blue;
const darkModeBaseColor = Color(0xFF121212);
const goodColor = Color(0xFF00D852);
const satisfactoryColor = Color(0xFF4AFE4A);
const moderateColor = Color(0xFFFADA00);
const poorColor = Color(0xFFFFA100);
const veryPoorColor = Color(0xFFFF0000);
const severeColor = Color(0xFFCF0000);

const emptyString = '';
const threeDots = '...';
const exclamation = '!';

const settings = 'Settings';
const darkModeTitle = 'Dark Mode';
const darkModeSubtitle =
    'Turns on/off dark mode. Turn on this setting if you want dark mode throughout the app';
const anErrorOccurred =
    'An error occurred. This may be due to your internet connection. Please try again later';
const pMOne = 'PM 1';
const pMTwoPointFive = 'PM 2.5';
const pMTen = 'PM 10';
const humidity = 'Humidity';
const temperature = 'Temperature';
const pyloop = 'Pyloop';
const ofHundred = 'of 100';
const ofFiveHundred = 'of 500';
const good = 'Good';
const satisfactory = 'Satisfactory';
const moderate = 'Moderate';
const poor = 'Poor';
const veryPoor = 'Very Poor';
const severe = 'Severe';
