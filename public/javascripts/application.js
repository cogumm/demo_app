$(document).ready(function(){
  $("#micropost_content").focus();
  
  $("#micropost_content").keyup(function(){
    var box=$(this).val();
    var main = box.length *100;
    var value= (main / 139);
    var count= 139 - box.length;
    
    if(box.length <= 139){
      $('#count').html(count);
      $('#bar').animate({"width": value+'%',}, 1);
    }
    else
    {
      alert('Opa, acabou o espaço!');
    }
      return false;
  });
});