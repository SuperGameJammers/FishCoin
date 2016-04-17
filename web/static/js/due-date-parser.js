// Parse date with Moment.js
$(function () {
  var dueDate = $('.iso-due-date').html();
  var dueDateParsed = moment(dueDate).format('MMMM Do YYYY');
  $('.iso-due-date').text(dueDateParsed);
});