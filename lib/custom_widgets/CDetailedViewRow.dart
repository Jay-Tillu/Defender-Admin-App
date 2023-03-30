import 'package:defender_admin/utilities/constants.dart';
import 'package:defender_admin/utilities/size_config.dart';
import 'package:flutter/material.dart';

class CDetailedViewRow extends StatelessWidget {
  CDetailedViewRow({@required this.optionName, @required this.value});
  final String optionName;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 7),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  optionName,
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: kFontRoboto,
                    fontSize: SizeConfig.blockSizeHorizontal * 5,
                  ),
                ),
              ],
            ),
            Divider(
              height: SizeConfig.blockSizeVertical * 4,
              endIndent: SizeConfig.blockSizeHorizontal * 5.5,
              thickness: SizeConfig.blockSizeVertical * 0.15,
            ),
          ],
        ),
      ),
    );
  }
}
