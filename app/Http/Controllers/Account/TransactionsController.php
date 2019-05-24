<?php
/**
 * LaraClassified - Classified Ads Web Application
 * Copyright (c) BedigitCom. All Rights Reserved
 *
 * Website: http://www.bedigit.com
 *
 * LICENSE
 * -------
 * This software is furnished under a license and may be used and copied
 * only in accordance with the terms of such license and with the inclusion
 * of the above copyright notice. If you Purchased from Codecanyon,
 * Please read the full License from here - http://codecanyon.net/licenses/standard
 */

namespace App\Http\Controllers\Account;


use Torann\LaravelMetaTags\Facades\MetaTag;
use MercadoPago\SDK;
use MercadoPago\Payment;
use MercadoPago\Payer;
use App;
use Illuminate\Support\Facades\DB;

class TransactionsController extends AccountBaseController
{
	private $perPage = 10;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->perPage = (is_numeric(config('settings.listing.items_per_page'))) ? config('settings.listing.items_per_page') : $this->perPage;
	}
	
	/**
	 * List Transactions
	 *
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function index()
	{
		$data = [];
		$data['transactions'] = $this->transactions->paginate($this->perPage);
		
		view()->share('pagePath', 'transactions');
		
		// Meta Tags
		MetaTag::set('title', t('My Transactions'));
		MetaTag::set('description', t('My Transactions on :app_name', ['app_name' => config('settings.app.app_name')]));
		
		return view('account.transactions', $data);
	}
	
	public function getPayment(){
		SDK::setAccessToken('TEST-1572775155493426-051321-89c7cefc62778089a2168e5fdd3c32db-33039052'); //MERCADOPAGO ACCESS TOKEN
		$payment = new Payment();
		
		$_token = $_POST['_token'];
		$paymentMethodId = $_POST['paymentMethodId'];
		$currency = $_POST['currency'];
		$price = $_POST['price'];
		$pesosPrice = $_POST['pesosAmount'];
		$token = $_POST['token'];
		$payerEmail = $_POST['payerEmail'];
		$postId = $_POST['postIdToRedirect'];
		$postTitle = $_POST['postTitleToRedirect'];
		
		$pesosPrice = number_format((float)((float)$pesosPrice/100), 2, '.', '');
		
		$payment->transaction_amount = $pesosPrice;
		$payment->token = $token;
		$payment->description = "LaraClassified - Classified Ads Web Application";
		$payment->installments = 1;
		$payment->payment_method_id = $paymentMethodId;
		$payment->payer = array(
			"email" => $payerEmail
		);
		
		$payment->save();
		
		DB::table('payments')->insert([
			['post_id' => $postId, 'package_id' => '', 'payment_method_id' => $paymentMethodId, 'transaction_id' => $payment->id, 'active' => '1', 'status' => $payment->status_detail]
		]);
		
		$route = $postTitle.'/'.$postId;
		$route = strtolower($route);
		$route = str_replace(" ", "-", $route);
		
		$lang = App::getLocale();
		
		if($lang != 'es')
			$route = $lang.'/'.$route;
		
		session()->flash('status', $payment->status_detail);
		return redirect($route);
	}
}
