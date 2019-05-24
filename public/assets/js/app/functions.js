'use strict'

/** Currency convert **/
$(document).ready(function(){
	$('#currency').on('change', function(){
		var currencies = [];
		var pos = 0;
		var i = 0;
		
		if($('#currency').val() != '0'){
			for(i = 1; i < $('#currency').children('option').length; i++){
				currencies.push($('#currency').children('option')[i]['value']);
			}
			
			convertCurrencies(currencies, pos, 0);
		}
	});
	
	$('#amount').on('change', function(){
		if($('#currency').val() != '0'){
			var currencies = [];
			for(var i = 1; i < $('#currency').children('option').length; i++){
				currencies.push($('#currency').children('option')[i]['value']);
			}
			
			for(var i = 0; i < currencies.length; i++){
				var value = localStorage.getItem(currencies[i]) * $('#amount').val();
				value = $('#suggested').val()+' '+value
				$('#'+currencies[i]).val('');
				$('#'+currencies[i]).attr('placeholder', value);
			}
		}
	});
});

function convertCurrencies(currencies, pos, i){
	var from = $('#currency').val();
	var to = currencies[i];
	var url = 'https://api.mercadolibre.com/currency_conversions/search?from='+from+'&to='+to;
	
	$.ajax({
		url: url,
		dataType: 'jsonp',
		type: 'GET',
		async: false,
		success:function(data){
			$('#'+currencies[pos]).val('');
			
			localStorage.setItem(currencies[pos], data[2].ratio);
			
			if($('#amount').val() != ''){
				$('#'+currencies[pos]).attr('placeholder', $('#suggested').val()+' '+(data[2].ratio * $('#amount').val()));
			}else{
				$('#'+currencies[pos]).attr('placeholder', $('#suggested').val()+' '+data[2].ratio);
			}
			pos++;
			i++;
			
			if(i < currencies.length){
				convertCurrencies(currencies, pos, i);
			}
		},
		error:function(data){
			
		}
	});
}

/** MercadoPago functions **/

function startMercadoPago(){
	Mercadopago.setPublishableKey("TEST-3231e71e-7fbe-4089-a107-dbe0ff8f33c6"); //MERCADOPAGO PUBLIC KEY
}

var doSubmit = false;

function setPaymentForm(){
	var paymentMethods = Mercadopago.getPaymentMethods();
	
	for(var i = 0; i < paymentMethods.length; i++){
		var select = document.getElementById('paymentMethod');
		var option = '<option value="'+paymentMethods[i].id+'">'+paymentMethods[i].name+'</option>';
		
		if(paymentMethods[i].payment_type_id == 'credit_card' || paymentMethods[i].payment_type_id == 'debit_card')
			select.innerHTML += option;
	}
	
	Mercadopago.getIdentificationTypes();
	
	getPesosPricing();
}

function getPesosPricing(){
	var from = $('#currency').val();
	var to = 'ARS';
	var url = 'https://api.mercadolibre.com/currency_conversions/search?from='+from+'&to='+to;
	
	if(from != 'ARS'){
		$.ajax({
			url: url,
			dataType: 'jsonp',
			type: 'GET',
			async: false,
			success:function(data){
				$('#pesosAmount').val((parseFloat(data[2].ratio) * parseFloat($('#price').val())).toFixed(2));
			},
			error:function(data){
				
			}
		});
	}else{
		$('#pesosAmount').val($('#price').val());
	}
}

function getPaymentMethod(){
	var bin = $('#cardNumber').val();
	Mercadopago.getPaymentMethod({"bin": bin},setPaymentMethodInfo);
}
		
function setPaymentMethodInfo(stat, response) {
    if (stat == 200) {
        $('#paymentMethodId').val(response[0].id);
    }
	console.log(response[0].id);
}

function doPay(){
	getPaymentMethod();
    if(!doSubmit){
        var $form = document.querySelector('#pay');

        Mercadopago.createToken($form, sdkResponseHandler);

        return false;
    }
}

function sdkResponseHandler(stat, response) {
    if (stat != 200 && stat != 201) {
        alert("verify filled data");
    }else{
        var frm = document.querySelector('#pay');
        var card = document.createElement('input');
        card.setAttribute('name', 'token');
        card.setAttribute('type', 'hidden');
        card.setAttribute('value', response.id);
        frm.appendChild(card);
        doSubmit=true;
        frm.submit();
    }
}











