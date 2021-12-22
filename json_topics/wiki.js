function getJSONP(url, success) {
    var ud = '_' + +new Date,
        script = document.createElement('script'),
        head = document.getElementsByTagName('head')[0] || document.documentElement;

    window[ud] = function(data) {
        head.removeChild(script);
        success && success(data);
    };

    script.src = url.replace('callback=?', 'callback=' + ud);
    head.appendChild(script);

}
getJSONP('http://en.wikipedia.org/w/api.php?format=json&action=query&titles=List_of_metropolitan_areas_by_population&prop=revisions&rvprop=content&callback=?', function(data){
    console.log(data);
    document.getElementById("output").innerHTML = data.query.normalized[0].from;

});