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

