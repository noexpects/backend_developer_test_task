/* Project specific Javascript goes here. */
$(document).ready(function () {
    var like = $('#like');
    var url = like.data('url');
    like.click(function () {
        $.post(url, function (data) {
            $("#likes-counter").text(data.likes);
        });
    })
})