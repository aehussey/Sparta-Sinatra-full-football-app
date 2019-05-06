$(function () {

  $.get("http://numbersapi.com/random/math", function(data) {

    $("#api").html(data)
  })
});
