<?php
namespace app\index\controller;

use think\Db;
use think\View;
use app\index\controller\PublicFun; //引入公共类方法
class Index extends BaseController
{
    public function index()
    {
    	$view = new View();
    	$view->banner = $this->getBanner();//获得轮播图
    	$view->goods = $this->getGoodList();//获得房产列表
    	return $view->fetch();
    }

    //返回轮播图数组
    public function getBanner(){
        $map["is_show"] = 1; //是否显示
        $list = Db::name("banner")->alias('b')->join("ys_uploadfile u","b.image = u.id"," left")->where($map)->order("b.weight desc,b.id asc")->select();
        return $list;
    }

    //返回商品列表数组
    public function getGoodList(){
        $map["is_show"] = 1; //是否显示
        $list = Db::name("goods")->where($map)->order("weight desc,id asc")->select();
        return $list;
    }
}
