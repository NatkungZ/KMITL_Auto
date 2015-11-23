var page = require('webpage').create();
var setURL = 'https://nac.kmitl.ac.th/dana-na/auth/url_default/welcome.cgi';
var sesionURL = 'https://nac.kmitl.ac.th/dana-na/auth/welcome.cgi?p=extend-session';
var logedinURL = 'https://nac.kmitl.ac.th/dana/home/infranet.cgi';
var foff='https://nac.kmitl.ac.th/dana-na/auth/url_default/welcome.cgi?p=forced-off';

var page = require('webpage').create();
page.open(setURL, function() {
  page.includeJs("http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js", function() {
      //var testadd = page.url;
      page.onLoadFinished = function(){
        page.render("nextPage.png");
      };
      page.onUrlChanged = function(targetUrl) {
        page.render('urlChange.png');
        console.log('New URL: ' + targetUrl);
      };
      if (page.url == setURL | page.url == foff | page.url == sesionURL) {
        page.evaluate(function() {
          var kmitlID = 'sXXXXXXX'; //KMITL User 
          var kmitlPWD = 'XXXXXXXX';//KMITL Password
          document.forms[0].elements[1].value = kmitlID;
          document.forms[0].elements[2].value = kmitlPWD;
          document.forms[0].submit();
          return;
        });
      };
      if (page.url == logedinURL) {
        page.evaluate(function() {
          var new_obj = document.getElementById('liveclock2').childNodes[2].textContent;
          var hours = parseInt(new_obj.substring(2,4));
          if ( hours <= 4 ) { 
            document.getElementById('Extendbg').click(); 
          } 
          return;
        });
      };
    
    });
});