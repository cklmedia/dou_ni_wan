#sidebar
$(document).ready ->
  $(".sidebar .nav .nav").hide()
  $(".sidebar .nav .active").show()
  $(".sidebar .nav .active").removeClass(".active")

  $(".sidebar h5").click () ->
    $(this).next(".nav").slideToggle("normal")


$(document).ready ->
  $("#user_add_button").click ->
    $("#user_add_modal").modal show: true
    return

$(document).ready ->
  $(".user_add_modal_close").click ->
    result = confirm("警告！关闭后将丢失已填写信息。")
    $("#user_add_modal").modal('hide') if result

$(document).ready ->
  $(".user_add_firend").change ->
    key = $(this).val()
    $.get "/users/key_email/" + key, (data) ->
      if data != null
        $(".key_result").html("<img src='"+data.avatar.url+"' class='img-rounded firend_avatar'/>") if data.avatar.url
        $(".key_result").after("<p>"+data.name"</p>")