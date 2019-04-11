function myMap() {
  var lat = document.getElementById("lat").getAttribute('value');
  var long = document.getElementById("long").getAttribute('value');
  var ubs = document.getElementById("ubs").getAttribute('value');
  var map = new google.maps.Map(document.getElementById("map"), mapOptions);
  var myCenter = new google.maps.LatLng(lat, long);
  var mapCanvas = document.getElementById("map");
  var mapOptions = {center: myCenter, zoom: 8};
  var map = new google.maps.Map(mapCanvas, mapOptions);
  var marker = new google.maps.Marker({position:myCenter});
  
  marker.setMap(map);
  console.log(ubs)
  var locations = JSON.parse("[" + ubs + "]")[0];

  for (i = 0; i < locations.length; i++) {  
    marker = new google.maps.Marker({
    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
      title: (locations[i][0]),
      map: map
    });
  }
}