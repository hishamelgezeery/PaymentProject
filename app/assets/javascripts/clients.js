function validate(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
}

function validatePhoneNumber(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\-/;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
}

function validateForm(evt){
	var validEmail = validateEmail();
	if(validEmail == false){
		evt.preventDefault();
		return false;
	}
}

function validateEmail() {
    var x = document.getElementById("email").value;;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
    return true;
}

function updateAmounts() {
  var value = document.getElementById("amount").value;
  document.getElementById("convenienceFee").value = parseFloat(value * .025).toFixed(2);
  document.getElementById("TotalAmt").value = parseFloat(value * 1.025).toFixed(2);
}

$(document).ready(function() {
    $('#payments').DataTable();
} );