import 'package:flutter/cupertino.dart';
abstract class ABC{
  ABC.undefined(){
    print("hi");
  }
  void doSome(){}
}
class ABCD with Worker implements ABC{
  @override
  void doSome([int age=22]) {
    super.age = age;
    print(name.runtimeType);
  }

}

mixin Worker{
  int age;
  dynamic name = 21;
}


void main(){
  ABCD().doSome(21);
  var list = [2,4,6]; // non-fixed array
  var lis1 = List<int>(4); //fixed array
  var lis2 = List<int>();
  list.sort((a,b)=>b-a);
  list.forEach((x)=>{if(x>3)print(x)});
  print(list);
  var set = Set();
  var set1 = {1,2,3,1};
  print(set1);
  set.add(1);
  set.add(1);
  set.add(2);
  print(set);

  var map = new Map();
  map.putIfAbsent(1, ()=>"abc");
  print(map);
  Map<int,String> map1 = {1:"ABC",2:"XYZ"};
  print(map1);
  map[21]= "hello";
  int a = 1;
  for(var item in map1.entries){
    print("$item+$a");
  }

}