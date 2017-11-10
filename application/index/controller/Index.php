<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
/**
 * 
 */
class Index extends controller
{
    public function index()
    {
    	if(session('user_name')){
    		$user_name=session('user_name');
    		$isBlackUser=isBlackUserF($user_name);
    		if(!$isBlackUser){
    			return view();
    		}else{
    			return view('appeal');
    		}
    	}else{
    		return view('login');
    	}
    }

    //判断用户状态，是否被拉入黑名单
    private function isBlackUserF($user_name){
    	return true;
    }

    //用户登陆
    public function loginF(){
    	$user_name=input('user_name');
    	$password=input('password');
    	$user=db('table_user')>where('user_name','=',$user_name)->find();
    	if($user){
    		if($user['pass_word']==$password){
		        session('user_name',$user_name);
		        session('user_id',$user['user_id']);
		        //登陆成功
		        
    		}else{
    			//密码不正确
    			
    		}
    	}else{
    		//用户名不存在
    		
    	}
    }


}
