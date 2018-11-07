import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rally_proto/colors.dart';
import 'package:rally_proto/models.dart';
import 'package:rally_proto/shared/balance_card.dart';
import 'package:rally_proto/shared/circle_chart.dart';

class AccountsPage extends StatefulWidget {
  AccountsPage({Key key}) : super(key: key);

  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> with SingleTickerProviderStateMixin {
  final List<SingleAccountModel> accountModels = <SingleAccountModel>[
    SingleAccountModel(
        name: 'Checking',
        accountNumber: '1234561234',
        usdBalance: 1000.50
    ),
    SingleAccountModel(
        name: 'Home Savings',
        accountNumber: '8888885678',
        usdBalance: 4321.99
    ),
    SingleAccountModel(
        name: 'Car Savings',
        accountNumber: '8888889012',
        usdBalance: 1.01
    ),
    SingleAccountModel(
        name: 'Vacation',
        accountNumber: '1231233456',
        usdBalance: 40.01
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          CircleChart(),
          SizedBox(height: 1.0, child: Container(color: Color(0xA026282F))),
          ListView(
            shrinkWrap: true,
            children: _buildBalanceCards(),
          )
        ]);
  }

  List<BalanceCard> _buildBalanceCards() {
    List<BalanceCard> list = [];
    for (int i = 0; i < accountModels.length; i++) {
      list.add(_buildBalanceCard(accountModels[i], i));
    }
    return list;
  }

  BalanceCard _buildBalanceCard(SingleAccountModel accountModel, int i) {
    return BalanceCard(
      suffix: Icon(Icons.chevron_right, color: Colors.grey),
      title: accountModel.name,
      subtitle: '• • • • • • ' + accountModel.accountNumber.substring(6),
      indicatorColor: RallyColors.getAccountColor(i),
      indicatorFraction: 1.0,
      usdAmount: accountModel.usdBalance,
    );
  }
}