$(document).ready(function() {
    $(window).bindWithDelay("scroll", function() {

        var url = $('.pagination .next_page').attr('href');
        if (url && $(window).height() > $(document).height() - $(window).scrollTop() - 250) {
            $('.la-dark').css({
                'display': 'block'
            });
            $.ajax({
                url: url,
                dataType: ('script'),
                success: function() {
                    $('.la-dark').css({
                        'display': 'none'
                    });
                    $('.ats').tooltipster({
                        animation: 'fade',
                        arrowColor: '#3d3d3d',
                        speed: '250',
                        content: 'Loading..',
                        interactive: true,
                        functionBefore: function(origin, continueTooltip) {

                            // we'll make this function asynchronous and allow the tooltip to go ahead and show the loading notification while fetching our data
                            continueTooltip();
                            // next, we want to check if our data has already been cached
                            if (origin.data('ajax') !== 'cached') {
                                $.ajax({
                                    type: 'GET',
                                    dataType: 'script',
                                    data: {
                                        profile_name: (this).attr('href').slice(1, 150)
                                    },
                                    url: '/tooltip',
                                    success: function(data) {
                                        // update our tooltip content with our returned data and cache it
                                    }
                                });
                            }
                        }
                    });

                }
            });
        }
    }, 500);
});
