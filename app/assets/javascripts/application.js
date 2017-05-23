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
//= require turbolinks
//= require_tree .

.alert {
    top: 10px;
    position: absolute;
    width: 40%;
    left: 30%;
    z-index: 10000;
    text-align: center;
}

.hidden {
    display: none;
}


body {
    background-image: url("/img/home2.png");
    background-attachment: fixed;
}