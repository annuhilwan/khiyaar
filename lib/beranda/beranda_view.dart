import 'package:progress_indicators/progress_indicators.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:khiyaar/api/api_service.dart';
import 'package:khiyaar/api/api_url.dart';
import 'package:khiyaar/baseurl/base_asset.dart';
import 'package:khiyaar/baseurl/base_style.dart';
import 'package:khiyaar/helper/remove_glow.dart';
import 'package:khiyaar/models/response_surat.dart';
import 'package:khiyaar/baseurl/base_app.dart';
import 'package:khiyaar/models/response_shalat.dart' as shalat;
import 'package:khiyaar/screens/paget_ayat.dart';
import 'package:khiyaar/beranda/prayers.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:khiyaar/beranda/beranda_khiyaar_appbar.dart';
import 'package:intl/intl.dart';
import 'package:khiyaar/models/prayer_time.dart';
import 'package:khiyaar/screens/home_screen.dart';
import 'package:khiyaar/screens/page_main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';

import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'prayer.dart';
import 'prayers.dart';
import 'jadwalkajian.dart';
import 'panduanibadah.dart';
import 'panduansosial.dart';
import 'panduandzikir.dart';
import 'kontendakwah.dart';
import 'kontensosial.dart';
import 'kontenposter.dart';
import 'konsultasiislam.dart';
import 'package:khiyaar/kiblat/kiblat.dart';
import 'package:khiyaar/beranda/jadwalkajian.dart';
import 'audiokajian.dart';
import 'profil.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => new _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    Widget containSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Center(
                child: Text(
                  'JADWAL KAJIAN',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Center(
                child: Text(
                  'VIDEO KAJIAN',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExampleApp()),
                );
              },
              child: Center(
                child: Text(
                  'AUDIO KAJIAN',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    Widget contain2Section = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PanduanIbadah()),
                );
              },
              child: Center(
                child: Text(
                  'PANDUAN IBADAH',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PanduanSosial()),
                );
              },
              child: Center(
                child: Text(
                  'PANDUAN DOA',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PanduanDzikir()),
                );
              },
              child: Center(
                child: Text(
                  'PANDUAN DZIKIR',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    Widget contain3Section = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KontenDakwah()),
                );
              },
              child: Center(
                child: Text(
                  'KONTEN DAKWAH',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KontenSosial()),
                );
              },
              child: Center(
                child: Text(
                  'KONTEN SOSIAL',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KontenPoster()),
                );
              },
              child: Center(
                child: Text(
                  'KONTEN POSTER',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    Widget contain4Section = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () => launch(
                  'https://www.google.com/maps?safe=strict&rlz=1C5CHFA_enID891ID891&sxsrf=ALeKk00YYWN07jmlhj5RSxwnj9x_vv2reQ:1607602226062&q=masjid&gs_lcp=CgZwc3ktYWIQAzIECCMQJzIKCC4QxwEQrwEQJzIECCMQJzIFCAAQywEyCwguEMcBEK8BEMsBMgsILhDHARCvARDLATIFCAAQywEyCwguEMcBEK8BEMsBMgsILhDHARCvARDLATILCC4QxwEQrwEQywE6BwgAEEcQsAM6BwgAELADEENQ8cYLWIPQC2D21gtoA3ACeACAAd8CiAHeBJIBBTItMS4xmAEAoAEBqgEHZ3dzLXdpesgBCsABAQ&uact=5&um=1&ie=UTF-8&sa=X&ved=2ahUKEwj-rLTZscPtAhUX8HMBHXoRBdoQ_AUoAnoECAUQBA'),
              child: Center(
                child: Text(
                  'LOKASI MASJID',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KonsultasiIslam()),
                );
              },
              child: Center(
                child: Text(
                  'KONSULTASI ISLAM',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Kiblat()),
                );
              },
              child: Center(
                child: Text(
                  'LOKASI KIBLAT',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    Widget contain5Section = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 110,
          height: 35,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profil()),
                );
              },
              child: Center(
                child: Text(
                  'PROFIL',
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    Widget terjemahanSection = Container(
        padding: EdgeInsets.all(16),
        child: Text(
          'Ya Allah, kami memohon kepadaMu ilmu yang bermanfaat, \n'
          'dan kami berlindung kepadaMu dari ilmu yang tidak bermanfaat. \n'
          '(HR. Ibnu Hibban, No. 82)',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ));

    HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);

    return new SafeArea(
        child: Scaffold(
      appBar: new KhiyaarAppBar(),
      body: new Container(
        child: new ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            new Container(
                margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 36.0),
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    _buildTglMenu(),
                  ],
                )),
            new Container(
                margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 36.0),
                child: new Column(
                  children: <Widget>[
                    _buildTextPilih(),
                  ],
                )),
            containSection,
            contain2Section,
            contain3Section,
            contain4Section,
            contain5Section,
            new Container(
                margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 36.0),
                child: new Column(
                  children: <Widget>[
                    _buildArab(),
                  ],
                )),
            terjemahanSection,
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    ));
  }
}

Widget _buildTglMenu() {
  var date = new DateTime.now().toString();

  var dateParse = DateTime.parse(date);
  String month;
  switch (dateParse.month) {
    case 1:
      month = "Januari";
      break;
    case 2:
      month = "Februari";
      break;
    case 3:
      month = "Maret";
      break;
    case 4:
      month = "April";
      break;
    case 5:
      month = "Mei";
      break;
    case 6:
      month = "Juni";
      break;
    case 7:
      month = "Juli";
      break;
    case 8:
      month = "Agustus";
      break;
    case 9:
      month = "September";
      break;
    case 10:
      month = "Oktober";
      break;
    case 11:
      month = "November";
      break;
    case 12:
      month = "Desember";
      break;
  }

  var formattedDate = "${dateParse.day} $month ${dateParse.year}";
  var formatday = "${dateParse.day}";
  var finalDay = formatday.toString();
  var finalDate = formattedDate.toString();

  var dates = DateTime.now();
  var daynow = DateFormat('EEEE').format(dates);
  String day;
  switch (daynow) {
    case 'Sunday':
      day = "Ahad";
      break;
    case 'Monday':
      day = "Senin";
      break;
    case 'Tuesday':
      day = "Selasa";
      break;
    case 'Wednesday':
      day = "Rabu";
      break;
    case 'Thursday':
      day = "Kamis";
      break;
    case 'Friday':
      day = "Jumat";
      break;
    case 'Saturday':
      day = "Sabtu";
      break;
  }

  var selectedDate = new HijriCalendar.now();
  var hijriDate = selectedDate.toFormat("dd MMMM yyyy");

  Widget _buildHijriMenu() {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                '$hijriDate H \n'
                '$finalDate M',
                style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ],
    ));
  }

  return new Container(
      height: 42.0,
      child: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 2.0, 2.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "Hari $day",
                  style: new TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(1.0, 0.1, 0, 2.0),
                  width: 130.0,
                  child: _buildHijriMenu(),
                )
              ],
            ),
          ),
        ],
      ));
}

Widget _buildSholatMenu() {
  return new Container(
      height: 40.0,
      child: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "Waktu Maghrib : 17.31",
                  style: new TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                new Container(
                  child: new Text(
                    "Insyaallah 22 menit lagi",
                    style: new TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ));
}

Widget _buildTextPilih() {
  return new Container(
      height: 40.0,
      child: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Silakan Pilih Layanan Yang Anda Butuhkan ! ",
                  style: new TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ));
}

Widget _buildTextSection(
  String text,
  double textSize,
  double paddingTop,
) {
  return Container(
    padding: EdgeInsets.only(top: paddingTop),
    child: Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        color: Colors.blue,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget _buildMenuSection(
  String title,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildTextSection(title, 16, 8),
    ],
  );
}

Widget _buildArab() {
  return new Container(
      height: 31.0,
      child: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(0.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "اَللَّهُمَّ إِنَّا نَسْأَلُكَ عِلْمًا نَافِعًا وَنَعُوْذُ بِكَ مِنْ عِلْمٍ لَا يَنْفَعُ",
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ));
}

class LokasiMasjid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(
        appBar: new KhiyaarAppBar(),
        body: Center(
          child: Text(
            'Lokasi Masjid',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Monserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class LokasiKiblat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(
        appBar: new KhiyaarAppBar(),
        body: Center(
          child: Text(
            'Lokasi Kiblat',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Monserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  String payload;

  NewScreen({
    @required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new BerandaPage(),
    );
  }
}
