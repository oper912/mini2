    /**
     * Manage text colors
     */

    function manageTextColors(){
        var regionClassToActive;
        $("[id^='region']").mouseover(function(){
            regionClassToActive = '.' + $(this).attr("data-class");
            $(regionClassToActive).addClass('active');
        }).mouseleave(function () {
            $(regionClassToActive).removeClass('active');
        });
    }

    manageTextColors();