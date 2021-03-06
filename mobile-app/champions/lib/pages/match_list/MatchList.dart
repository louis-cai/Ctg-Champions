import 'package:flutter/material.dart';
import 'MatchRow.dart';
import 'package:champions/inheritedUserWidget.dart';
import 'package:champions/inheritedMatchList.dart';
import 'package:champions/ThemeBis.dart' as ThemeBis;
class MatchList extends StatelessWidget {
  final DateTime date;
  final Function setDate;
  MatchList(this.date, this.setDate);
  
  
  
  @override
  Widget build(BuildContext context) {
    final MyInheritedMatchListWidgetState matches = MyInheritedMatchListWidget.of(context);
    
    final MyInheritedUserWidgetState userstate = MyInheritedUserWidget.of(context);
    //print (date.toString());
    //print ("Matchlist: " + date.toString());
    List matchesFiltered = matches.matchEvents.where(
      (i)=>i.date.day == date.day 
      && i.date.month == date.month && 
      i.date.year == date.year).toList();
    //print(matchesFiltered.toString());

    //final List<Encounter> matches = State.of(MyInheritedMatchListWidget.of(context));
    return 
          
          Row(children: <Widget>[
          
          Expanded(child:

          Container(
            color: Colors.black45,
            child: matchesFiltered.length < 1 ? Center(child:Text("No Matches", style: ThemeBis.TextStyles.appBarTitle,)) :
            matchesFiltered.length < 4 ?
          ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(0),
         itemExtent: 170.0,
          itemCount: matchesFiltered.length,
          //shrinkWrap: true,
          itemBuilder: (_, index) => EncounterRow(matchesFiltered[index], userstate.user),
        
    
    )
    :  
          ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(0),
          itemExtent: 170.0,
          itemCount: matchesFiltered.length,
          shrinkWrap: true,
          itemBuilder: (_, index) => EncounterRow(matchesFiltered[index], userstate.user),
        
    
    ) 
    ,))]);
    }
}