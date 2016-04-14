// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.tooltipster.min.js
//= require jquery.remotipart
//= require jquery.atwho
//= require sweetalert
//= require jquery.turbolinks
//= require_tree .

$(document).ready(function(){
    
   $(".spinner").hide();  
   $('.ats').tooltipster({
            animation: 'fade',
            arrowColor: '#3d3d3d',
            speed: '250',
            content: 'Loading',
            interactive: true,
            functionBefore: function(origin, continueTooltip) {

                // we'll make this function asynchronous and allow the tooltip to go ahead and show the loading notification while fetching our data
                continueTooltip();
                // next, we want to check if our data has already been cached
                if (origin.data('ajax') !== 'cached') {
                    $.ajax({
                        type: 'GET',
                        dataType: 'script',
                        data: { profile_name: (this).attr('href').slice(1,150)},
                        url: '/tooltip',
                        success: function(data) {
                            // update our tooltip content with our returned data and cache it
                        }
                    });
                }
            }
        });
})

$(document).on("page:fetch", function(){
  $(".spinner").show();
});

$(document).on("page:receive", function(){
  $(".spinner").hide();
});
