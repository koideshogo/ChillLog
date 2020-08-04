// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require moment
//= require fullcalendar
//= require_tree .

// $(function () {
//   $('#calendar').fullCalendar({
//   events: '/events.json'
//   });
// });

$(function () {
$('#calendar').fullCalendar({
    events: '/events.json',
  eventRender: function(events, element) {
if(events.image){
    $(element[0])  //imageプロパティが存在するイベントだけtitleを画像に差し替え
    .css("border-color", "transparent")
    .css("background-color", "transparent")
    .html('<image class="photo" size="10x10" src="'+events.image+'" />');
}
  }
//   events: [
// {
//     title: '通常のイベント',
//     // start: new Date(y, m, 15),
// },
// {
//     title: '画像　イベント',
//     // start: new Date(y, m, 1),
//     image:"image2.jpg"
// },
// {
//     title: '画像　イベント',
//     // start: new Date(y, m, 2),
//     image:"image3.jpg"
// }
//   ]
});
});