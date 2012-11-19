(($) ->
    $('.nav li').on 'click', (e) ->
        e.preventDefault()

        fade_in_el = '.' + $(@).data 'content'
        fade_out_el = '.' + $('.active').data 'content'

        $('.active').removeClass 'active'
        $(@).addClass 'active'

        window.location.hash = fade_in_el.substring(1)

        $(fade_out_el).fadeOut 'normal', () ->
            $(fade_in_el).fadeIn 'normal'
            return
        return false

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
        return false

    # Fade in the initial section
    active_section = if window.location.hash is '' then 'intro' else window.location.hash.substring(1)
    $("[data-content=#{active_section}]").addClass 'active'
    $('.' + active_section).fadeIn 'normal'
    return
) jQuery
