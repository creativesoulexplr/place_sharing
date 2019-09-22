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
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require bootstrap-sprockets
//= require_tree .




var currentMap, currentInfoWindow;
var IconeImage = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
var updatedLatLng = "";

function initMap() {
  if(!$("#currentMap")[0]){
    return false;
  }
		var defLatLng = {lat: -25.363, lng: 131.044};

		updatedLatLng = defLatLng;

        currentMap = new google.maps.Map(document.getElementById('currentMap'), {
          center: defLatLng,
          zoom: 6
         // draggable: true

        });
        infoWindow = new google.maps.InfoWindow;

        var currentMarker = new google.maps.Marker({
		  		title: "Current Location",
		  		position: defLatLng,
		  		map: currentMap,
		  		draggable: true
			});

        

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            updatedLatLng = pos;
            currentMarker.setPosition(pos)

            infoWindow.setPosition(pos);
            infoWindow.setContent('Your Location');

            currentMarker.setMap(currentMap);

            currentMarker.addListener('dragend',function(newLocation){
            	//alert()
            	updatedLatLng = { lat: newLocation.latLng.lat(), lng: newLocation.latLng.lng() }
            	console.log(updatedLatLng);
            });

            currentMap.setCenter(pos);

            

			


          }, function() {
            handleLocationError(true, infoWindow, currentMap.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, currentMap.getCenter());
        }
        locationForm();
      }


       function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(currentMap);
      }


 function locationForm(){
 	var loaderimg = "<img src ='/images/ajax-loader.gif' />";
 	$("form#locationForm").submit(function(event){
 		event.preventDefault();
 		$("form#locationForm .loader").html(loaderimg);
 		$("form#locationForm .submit-btn").hide();
 		var targetUrl = $(this).attr("action");

 		if(updatedLatLng == ""){
 			alert("Location not found!");
 			return false;
 		}

 		$("input#place_lat").val(updatedLatLng.lat);
 		$("input#place_lng").val(updatedLatLng.lng);

 		var formData = $(this).serialize();

 		$.ajax({
 			url: targetUrl,
 			method: "post",
 			data: formData,
 			dataType: "json",
 			success: function(resp){
 				$("form#locationForm .loader").html('');
 				$("form#locationForm .submit-btn").show();
        window.location = "";
 			},
 			error: function(errors){
 				console.log(errors.responseText);
        $("form#locationForm .loader").html('');
        $("form#locationForm .submit-btn").show();
 			}
 		});
 	});
 }



  function userLocationMap(location, $this){
    var LatLng = {lat: location.lat, lng: location.lng };
    var userlocationmap = new google.maps.Map(document.getElementById('userlocationmap'), {
          center: LatLng,
          zoom: 11
         // draggable: true

        });

    var laddress = $($this).data("address");

    console.log(laddress)

        var infouWindow = new google.maps.InfoWindow({
          content: laddress
        });

        var clMarker = new google.maps.Marker({
          position: LatLng,
          map: userlocationmap,
          draggable: true
      });

         clMarker.setMap(userlocationmap);

         clMarker.addListener('click',function(){
              //alert()
               infouWindow.open(userlocationmap, clMarker);
         });

         $("html, body").animate({ scrollTop: $(document).height() }, 1000);
         return false;
 }



$( document ).on('turbolinks:load', function() {
  initMap();
})