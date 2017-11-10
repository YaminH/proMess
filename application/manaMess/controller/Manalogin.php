<?php
namespace app\manaMess\controller;
use think\Controller;
use think\Db;
/**
* 
*/
class Manalogin extends controller
{
	
	public function index()
	{
		if(session('admin_name')){
			$this->assign('admin_name',session('admin_name'));
			return view('manaindex');
		}else{
			return view('manalogin');
		}		
	}

	public function loginM()
	{
		$admin_name=input('admin_name');
    	$admin_password=input('admin_password');
    	$admin=db('table_admin')>where('admin_name','=',$admin_name)->find();
    	if($admin){
    		if($admin['pass_word']==$admin_password){
		        session('admin_name',$admin_name);
		        session('admin_id',$user['admin_id']);
		        //登陆成功
		        return array('success' => true,'message' =>'登陆成功');
    		}else{
    			//密码不正确
    			return array('success' => false,'message'=>'密码不正确');
    		}
    	}else{
    		//用户名不存在
    		return array('success' => false,'message'=>'密码不正确');
    	}
	}

	public function logout()
	{
		session('admin_name',null);
	    return array('success' => true,'message' =>'注销成功');
	}
}