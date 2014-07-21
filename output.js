function init(list) {
  var result = [];
  // console.log(list);
  for (var i=0; i < list.length; i++){
    var item = 'item' + list[i];
    // console.log(item);
    result.push(function (){console.log(item + '' + list[i])});
    //item3 because the functions are being re-written every single time since there's no title to it? WRONG
  }
  // console.log(result[0]())
  return result;
}

function foo(){
  var list = init([1, 2, 3]);
  // console.log(list[0]());
  for (var j = 0; j < list.length; j++){
    list[j]();
  }
}

foo();

//item3undefined
//item3undefined
//item3undefined