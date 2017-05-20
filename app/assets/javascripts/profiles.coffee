# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# revertToOriginalURL = ->
#   original = window.location.href.substr(0, window.location.href.indexOf('#'))
#   history.replaceState {}, document.title, original
#   return

# $(window.location.hash).modal 'show'
# $('a.btn-modal').click ->
#   window.location.hash = $(this).attr('href')
#   return
  
# $('.modal').on 'hidden.bs.modal', ->
#   revertToOriginalURL()
#   return


$(document).ready ->

  # JS to hide empty fields...
  if $('#headline-field').is(':empty')
    $('#headline-field').hide()
  else
