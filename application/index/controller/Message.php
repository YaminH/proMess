<?php
namespace app\index\controller;
use think\Controller;
use think\Db;

/**
* 
*/
class Message extends controller
{
	public function index(){
		$data=Db('view_table_message')->select();
		$this->assign('messages',$data);
		return view('messList');
	}
	
	public function addMess(){

	}

	public function edutMess(){

	}

	public function informMess(){

	}

}