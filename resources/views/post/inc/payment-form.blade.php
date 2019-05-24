<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<div class="modal-header">
				<h2 class="modal-title">
					<strong><i class="icon-docs"></i> {{ t('process payment') }}</strong>
				</h2>
				
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">{{ t('Close') }}</span>
				</button>
			</div>
			
			<form id="pay" name="pay" role="form" method="POST" action="../getPayment" enctype="multipart/form-data">
				{!! csrf_field() !!}
				<div class="modal-body">
					<!-- payment method -->				
					<div class="form-group row required">
						<label class="col-md-3 col-form-label">{{ t('payment method') }} <sup>*</sup></label>
						<div class="col-md-8">
							<select id="paymentMethod" class="form-control"></select>
						</div>
					</div>
					
					<!-- card number -->				
					<div class="form-group row required">
						<label class="col-md-3 col-form-label">{{ t('card number') }} <sup>*</sup></label>
						<div class="col-md-8">
							<input type="text" id="cardNumber" data-checkout="cardNumber" placeholder="4509 9535 6623 3704" onselectstart="return false" onpaste="return false" onCopy="return false" onCut="return false" onDrag="return false" onDrop="return false" autocomplete=off class="form-control"/>
						</div>
					</div>
					
					<!-- expired month -->				
					<div class="form-group row required">
						<label class="col-md-3 col-form-label">{{ t('expired month') }} <sup>*</sup></label>
						<div class="col-md-8">
							<select id="cardExpirationMonth" data-checkout="cardExpirationMonth" placeholder="12" onselectstart="return false" onpaste="return false" onCopy="return false" onCut="return false" onDrag="return false" onDrop="return false" autocomplete=off class="form-control">
								<option value="1">{{ t('January') }}</option>
								<option value="2">{{ t('February') }}</option>
								<option value="3">{{ t('March') }}</option>
								<option value="4">{{ t('April') }}</option>
								<option value="5">{{ t('May') }}</option>
								<option value="6">{{ t('June') }}</option>
								<option value="7">{{ t('July') }}</option>
								<option value="8">{{ t('August') }}</option>
								<option value="9">{{ t('September') }}</option>
								<option value="10">{{ t('October') }}</option>
								<option value="11">{{ t('November') }}</option>
								<option value="12">{{ t('December') }}</option>
							</select>
						</div>
					</div>
					
					<!-- expired year -->
					<?php $year = date("Y");?>
					<div class="form-group row required">
						<label class="col-md-3 col-form-label">{{ t('expired year') }} <sup>*</sup></label>
						<div class="col-md-8">
							<select id="cardExpirationYear" data-checkout="cardExpirationYear" placeholder="2015" onselectstart="return false" onpaste="return false" onCopy="return false" onCut="return false" onDrag="return false" onDrop="return false" autocomplete=off class="form-control">
								@for($i = 0; $i < 10; $i++)
									<option value="{{ $year + $i }}">{{ $year + $i }}</option>
								@endfor
							</select>
						</div>
					</div>
					
					<!-- card holder name -->
					<div class="form-group row required">
						<label class="col-md-3 col-form-label">{{ t('owners name') }} <sup>*</sup></label>
						<div class="col-md-8">
							<input type="text" id="cardholderName" data-checkout="cardholderName" class="form-control" />
						</div>
					</div>
					
					<!-- payer's email -->
					<div class="form-group row required">
						<label class="col-md-3 col-form-label">{{ t('email') }} <sup>*</sup></label>
						<div class="col-md-8">
							<input type="text" id="payerEmail" name="payerEmail" class="form-control" />
						</div>
					</div>
					
					<!-- security code -->
					<div class="form-group row required">
						<label class="col-md-3 col-form-label">{{ t('security code') }} <sup>*</sup></label>
						<div class="col-md-8">
							<input type="text" id="securityCode" data-checkout="securityCode" placeholder="123" onselectstart="return false" onpaste="return false" onCopy="return false" onCut="return false" onDrag="return false" onDrop="return false" autocomplete=off class="form-control"/>
						</div>
					</div>
					
					<!-- document type -->
					<div class="form-group row required">
						<label class="col-md-3 col-form-label">{{ t('document type') }} <sup>*</sup></label>
						<div class="col-md-8">
							<select id="docType" data-checkout="docType" class="form-control"></select>
						</div>
					</div>
					
					<!-- document number -->
					<div class="form-group row required">
						<label class="col-md-3 col-form-label">{{ t('document number') }} <sup>*</sup></label>
						<div class="col-md-8">
							<input type="text" id="docNumber" data-checkout="docNumber" placeholder="12345678" class="form-control"/>
						</div>
					</div>
					
					@include('layouts.inc.tools.recaptcha', ['label' => true])
				</div>
				
				<input id="paymentMethodId" type="hidden" name="paymentMethodId" />
				<input type="hidden" id="currency" name="currency" value="{{ $post->currency }}" />
				<input type="hidden" id="pesosAmount" name="pesosAmount"/>
				<input type="hidden" id="price" name="price" value="{{ $post->price }}" />
				<input type="hidden" id="postIdToRedirect" name="postIdToRedirect" value="{{ $post->id }}">
				<input type="hidden" id="postTitleToRedirect" name="postTitleToRedirect" value="{{ $post->title }}">
			</form>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">{{ t('Cancel') }}</button>
				<button onclick="doPay()" type="submit" class="btn btn-success pull-right">{{ t('Pay') }}</button>
			</div>
		</div>
	</div>
</div>
@section('after_styles')
	@parent
	<link href="{{ url('assets/plugins/bootstrap-fileinput/css/fileinput.min.css') }}" rel="stylesheet">
	@if (config('lang.direction') == 'rtl')
		<link href="{{ url('assets/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css') }}" rel="stylesheet">
	@endif
	<style>
		.krajee-default.file-preview-frame:hover:not(.file-preview-error) {
			box-shadow: 0 0 5px 0 #666666;
		}
	</style>
@endsection

@section('after_scripts')
    @parent
	
	<script src="{{ url('assets/plugins/bootstrap-fileinput/js/plugins/sortable.min.js') }}" type="text/javascript"></script>
	<script src="{{ url('assets/plugins/bootstrap-fileinput/js/fileinput.min.js') }}" type="text/javascript"></script>
	<script src="{{ url('assets/plugins/bootstrap-fileinput/themes/fa/theme.js') }}" type="text/javascript"></script>
	@if (file_exists(public_path() . '/assets/plugins/bootstrap-fileinput/js/locales/'.ietfLangTag(config('app.locale')).'.js'))
		<script src="{{ url('assets/plugins/bootstrap-fileinput/js/locales/'.ietfLangTag(config('app.locale')).'.js') }}" type="text/javascript"></script>
	@endif

	<script>
		/* Initialize with defaults (Resume) */
		$('#filename').fileinput(
		{
			theme: "fa",
            language: '{{ config('app.locale') }}',
			@if (config('lang.direction') == 'rtl')
				rtl: true,
			@endif
			showPreview: false,
			allowedFileExtensions: {!! getUploadFileTypes('file', true) !!},
			showUpload: false,
			showRemove: false,
			maxFileSize: {{ (int)config('settings.upload.max_file_size', 1000) }}
		});
	</script>
	<script>
		$(document).ready(function () {
			@if ($errors->any())
				@if ($errors->any() and old('messageForm')=='1')
					$('#contactUser').modal();
				@endif
			@endif
		});
	</script>
@endsection
