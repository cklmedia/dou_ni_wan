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
    key = $(this).val().replace(".","~")
    $(".key_result_name").html("")
    $(".key_result_avatar").html("")
    $(".key_result_link").html("")
    $.get "/users/key_email/" + key, (data) ->
      if data
        $(".key_result_avatar").html("<img src='"+data.avatar.url+"' class='img-rounded firend_avatar'/>") if data.avatar.url
        $(".key_result_avatar").html("<img src='/assets/default_avatar.jpg' class='img-rounded firend_avatar'/>") if !data.avatar.url
        $(".key_result_name").html("<p>"+data.name+"</p>")
        $(".key_result_link").html("<a href='/users/add_friend/"+data.id+"' class='btn btn-xs btn-success'>+添加为逗友</a>")