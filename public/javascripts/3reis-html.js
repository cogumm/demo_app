$(document).ready(function(){

  // Adiciona a classe field_with_errors nos campos de validação
  $('.field_with_errors').each(function(index){
    $($(this).html()).insertBefore($(this));
    $(this).parent().addClass("field_with_error").removeClass("field");
    $(this).remove();
  });
});
