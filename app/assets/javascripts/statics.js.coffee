# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
(($) ->
    $('li > a').click (e) ->
        e.preventDefault()
        
        fade_in_id = $(this).attr 'href'
        fade_out_id = $('.active > a').attr 'href'
        
        $('.active').removeClass 'active'
        $(this).parent().addClass 'active'
        
        window.location = fade_in_id
        
        $(fade_out_id).fadeOut "normal", () ->
            $(fade_in_id).fadeIn "normal"
            return
    
    active_section = if window.location.hash is "" then "#intro" else window.location.hash
    
    $("[href=#{active_section}]").parent().addClass 'active'
    $(active_section).fadeIn "normal"
    return
) jQuery

