import 'package:defender_admin/custom_widgets/CDetailedViewRow.dart';
import 'package:defender_admin/screens/main_screen.dart';
import 'package:defender_admin/utilities/constants.dart';
import 'package:defender_admin/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ProfileView extends StatelessWidget {
  static const screenID = "Profile View";
  @override
  Widget build(BuildContext context) {
    Map receivedData = ModalRoute.of(context).settings.arguments;
    var queryResult = receivedData['queryResult'];
    SizeConfig().init(context);
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);

    return Scaffold(
//**************** Appbar  ******************/
      appBar: AppBar(
        backgroundColor: Colors.white12,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
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
          "Visitor Details",
          style: TextStyle(color: Colors.black),
        ),
      ),

//**************** Body  ******************/
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
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
                  child: queryResult.docs[0].data()['Url'] == null
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
                            image: queryResult.docs[0].data()['Url'],
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
                value:
                    "${queryResult.docs[0].data()['Name']} ${queryResult.docs[0].data()['Surname']}",
              ),
            ),

//###################  Mobile Number  #####################
            CDetailedViewRow(
              optionName: 'Mobile No: ',
              value: "${queryResult.docs[0].data()['Mobile_Number']}",
            ),

//*****************  ListView Builder  **********************/
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: queryResult.docs.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
//#####################  Date Container  #####################
                      Container(
                        height: SizeConfig.blockSizeVertical * 5.3,
                        margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 5,
                          right: SizeConfig.blockSizeHorizontal * 5,
                          top: SizeConfig.blockSizeVertical * 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                            SizeConfig.blockSizeHorizontal * 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${DateFormat('dd MMM yyyy').format((queryResult.docs[index].data()['Entry_Time']).toDate())}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.blockSizeHorizontal * 5.3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

//###################  Entry Time  #####################
                      Padding(
                        padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2,
                        ),
                        child: CDetailedViewRow(
                          optionName: 'Entry Time: ',
                          value:
                              "${DateFormat('hh:mm a').format((queryResult.docs[index].data()['Entry_Time']).toDate())}",
                        ),
                      ),

                      //###################  Vehicle Number  #####################
                      CDetailedViewRow(
                        optionName: 'Vehicle No: ',
                        value:
                            "${queryResult.docs[index].data()['Vehicle_Number']}",
                      ),

//###################  Block Name  #####################
                      CDetailedViewRow(
                        optionName: 'Block Name: ',
                        value:
                            "${queryResult.docs[index].data()['Block_Name']}",
                      ),

//###################  House Number  #####################
                      CDetailedViewRow(
                        optionName: 'House No: ',
                        value:
                            "${queryResult.docs[index].data()['House_Number']}",
                      ),

//###################  No Of Visitor  #####################
                      CDetailedViewRow(
                        optionName: 'No of visitor: ',
                        value:
                            "${queryResult.docs[index].data()['No_of_Visitor']}",
                      ),

//###################  Purpose  #####################
                      CDetailedViewRow(
                        optionName: 'Purpose: ',
                        value: "${queryResult.docs[index].data()['Purpose']}",
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
