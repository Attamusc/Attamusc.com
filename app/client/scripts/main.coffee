(($) ->
    $('li > a').on 'click', (e) ->
        e.preventDefault()
        
        fade_in_id = $(@).attr 'href'
        fade_out_id = $('.active > a').attr 'href'
        
        $('.active').removeClass 'active'
        $(@).parent().addClass 'active'
        
        window.location = fade_in_id
        
        $(fade_out_id).fadeOut 'normal', () ->
            $(fade_in_id).fadeIn 'normal'
            return 

    $('.experience-list > li').on 'mouseenter', (e) ->
        e.preventDefault()
        popup_window = $("<div class='popup'><div class='arrow-border'></div><div class='arrow'></div><div class='popup-content'>#{$(@).data('popup')}</div></div>")
        $(popup_window).hide()
        $(@).append(popup_window);
        $(popup_window).fadeIn 'fast'
        $(@).on 'mouseleave', (e) =>
            e.preventDefault()
            $(popup_window).fadeOut 'fast', () ->
                $(popup_window).remove()
    
    # Fade in the initial section
    active_section = if window.location.hash is '' then '#intro' else window.location.hash
    $("[href=#{active_section}]").parent().addClass 'active'
    $(active_section).fadeIn 'normal'
    return
) jQuery
