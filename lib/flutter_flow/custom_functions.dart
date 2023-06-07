import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double subtotal(
  double curentProductPrice,
  int counter,
  double cartSum,
  int itemCount,
) {
  if (itemCount < counter) {
    return cartSum + (curentProductPrice * counter);
  }
  return cartSum + ((curentProductPrice * -1) * counter);
}
