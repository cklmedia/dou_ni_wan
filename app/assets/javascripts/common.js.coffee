#sidebar
$(document).ready ->
  $(".sidebar .nav .active").show()
  $(".sidebar .nav .active").removeClass(".active")

  $(".sidebar h5").click () ->
    $(this).next(".nav").slideToggle("normal")