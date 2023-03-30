import 'package:defender_admin/custom_widgets/CDetailedViewRow.dart';
import 'package:defender_admin/screens/main_screen.dart';
import 'package:defender_admin/utilities/constants.dart';
import 'package:defender_admin/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YesterdayVisitorDetailView extends StatelessWidget {
  static const screenID = 'Yesterday Visitor Detail View';
  @override
  Widget build(BuildContext context) {
    Map receivedData = ModalRoute.of(context).settings.arguments;
    SizeConfig().init(context);
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white12,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                MainScreen.screenID,
              );
            },
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Visitor Details',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(kBgImage),
//****************  Image  ***********************
                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5,
                      left: SizeConfig.blockSizeHorizontal * 12,
                      right: SizeConfig.blockSizeHorizontal * 12,
                    ),
                    child: receivedData['photoUrl'] == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(
                              SizeConfig.blockSizeVertical * 3,
                            ),
                            child: Image.asset(
                              kImmolationLogoImage,
                              fit: BoxFit.cover,
                              height: SizeConfig.blockSizeVertical * 32,
                              width: SizeConfig.blockSizeHorizontal * 57,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(
                              SizeConfig.blockSizeVertical * 2,
                            ),
                            child: FadeInImage.assetNetwork(
                              placeholder: kImmolationLogoImage,
                              image: receivedData['photoUrl'],
                              fadeInCurve: Curves.fastOutSlowIn,
                              height: SizeConfig.blockSizeVertical * 32,
                              width: SizeConfig.blockSizeHorizontal * 57,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ],
              ),

//*****************  Visitor Detail Container  ***************/
              Container(
                height: SizeConfig.blockSizeVertical * 5.3,
                margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 5,
                  right: SizeConfig.blockSizeHorizontal * 5,
                  top: SizeConfig.blockSizeVertical * 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.pink[600],
                  borderRadius: BorderRadius.circular(
                    SizeConfig.blockSizeHorizontal * 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Visitor Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal * 5.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

//###################  Name  #####################
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 3,
                ),
                child: CDetailedViewRow(
                  optionName: 'Name: ',
                  value: "${receivedData['name']} ${receivedData['surname']}",
                ),
              ),

//###################  Mobile Number  #####################
              CDetailedViewRow(
                optionName: 'Mobile No: ',
                value: "${receivedData['mobileNumber']}",
              ),

//###################  Vehicle Number  #####################
              CDetailedViewRow(
                optionName: 'Vehicle No: ',
                value: "${receivedData['vehicleNumber']}",
              ),

//###################  Block Name  #####################
              CDetailedViewRow(
                optionName: 'Block Name: ',
                value: "${receivedData['blockName']}",
              ),

//###################  House Number  #####################
              CDetailedViewRow(
                optionName: 'House No: ',
                value: "${receivedData['houseNumber']}",
              ),

//###################  No Of Visitor  #####################
              CDetailedViewRow(
                optionName: 'No of visitor: ',
                value: "${receivedData['noOfVisitor']}",
              ),

//###################  Purpose  #####################
              CDetailedViewRow(
                optionName: 'Purpose: ',
                value: "${receivedData['purpose']}",
              ),

//###################  Entry Date  #####################
              CDetailedViewRow(
                optionName: 'Entry Date: ',
                value: "${receivedData['entryDate']}",
              ),

//###################  Entry Time  #####################
              CDetailedViewRow(
                optionName: 'Entry Time: ',
                value: "${receivedData['entryTime']}",
              ),

              SizedBox(
                height: SizeConfig.blockSizeVertical * 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
