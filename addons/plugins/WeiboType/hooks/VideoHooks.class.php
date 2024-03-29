<?php
require_once('AbstractWeiboTypeHooks.class.php');
/**
 * ImageHooks
 * 图片微博插件
 * 可以上传多张图片
 * @uses Hooks
 * @package
 * @version $id$
 * @copyright 2001-2013 SamPeng
 * @author SamPeng <penglingjun@zhishisoft.com>
 * @license PHP Version 5.2 {@link www.sampeng.org}
 */
class VideoHooks extends AbstractWeiboTypeHooks
{
    public $typeCode = 3;

    /**
     * home_index_middle_publish_type
     * 在发布微博底部可以自由添加类型,这里将添加一个图片的效果
     * @access public
     * @return void
     */
    public function _addWeiboTypeHtml()
    {
        $html = sprintf("<a href='javascript:void(0)' onclick='weibo.plugin.video.click(this)' class='a52'><img class='icon_add_video_d' src='%s' />视频</a>",$this->htmlPath."/html/images/zw_img.gif");
        echo $html;
    }


    public function _weiboTypePublish($type_data)
    {
        $link = $type_data;
        $parseLink = parse_url($link);
        if(preg_match("/(youku.com|youtube.com|5show.com|ku6.com|sohu.com|mofile.com|sina.com.cn|tudou.com)$/i", $parseLink['host'], $hosts)) {
            $flashinfo = $this->_video_getflashinfo($link, $hosts[1]);
        }
        if ($flashinfo['flashvar']) {
            $typedata['flashvar']  = $flashinfo['flashvar'];
            $typedata['flashimg']  = $flashinfo['img'];
            $typedata['host']      = $hosts[1];
            $typedata['source']    = $type_data;
            $typedata['title']     = $flashinfo['title'];
        }
        return $typedata;

    }

    public function _weiboTypeShow($typeData,$rand)
    {
    	$typeData['flashimg'] = ($typeData['flashimg']) ? $typeData['flashimg'] : __THEME__.'/images/nocontent.png';
        $this->assign('data',$typeData);
        $this->assign('rand',$rand);
        $res = $this->fetch('video');
        return $res;
    }




    /**
     * uploadImage
     * 上传图片接受处理
     * @access public
     * @return void
     */
    public function paramUrl()
    {
        $link = t($_POST['url']);
        $parseLink = parse_url($link);
        if(preg_match("/(youku.com|youtube.com|5show.com|ku6.com|sohu.com|mofile.com|sina.com.cn|tudou.com)$/i", $parseLink['host'], $hosts)) {
            $return['boolen'] = 1;
            $return['data']   = getShortUrl($link);
        }else{
            $return['boolen'] = 0;
            $return['message'] = L('only_support_video');
        }

        $flashinfo = $this->_video_getflashinfo($link, $hosts[1]);

        $return['data'] = $flashinfo['title'].$return['data'];
        $return['publish_type'] = $this->typeCode;

        exit( json_encode($return) );

    }

    private function _video_getflashinfo($link, $host)
    {
        $return='';
        $content = file_get_contents("compress.zlib://".$link);//获取
        if('youku.com' == $host)
        {
            preg_match('/http:\/\/v\.t\.sina\.com\.cn\/share\/share\.php\?[^"]+/i', $content, $share_url);
            preg_match('/id\_(\w+)\.html/', $share_url[0], $flashvar);
            preg_match('/pic=([^"&]+)/', $share_url[0], $img);
            preg_match('/title=([^"&]+)/', $share_url[0], $title);
            if (!empty($title[1])) {
                $title[1] = urldecode($title[1]);
            } else {
                preg_match("/<title>(.*?)<\/title>/i",$content,$title);
            }
        }
        elseif('ku6.com' == $host)
        {
            preg_match("/\/([\w\-]+)\.html/",$link,$flashvar);
            preg_match("/<span class=\"s_pic\">(.*?)<\/span>/i",$content,$img);
            preg_match("/<title>(.*?)<\/title>/i",$content,$title);
            $title[1] = iconv("GBK","UTF-8",$title[1]);
        }
        elseif('sina.com.cn' == $host)
        {
            preg_match("/vid=(.*?)\/s\.swf/",$content,$flashvar);
            preg_match("/pic\:[ ]*\'(.*?)\'/i",$content,$img);
            preg_match("/<title>(.*?)<\/title>/i",$content,$title);
        }
        elseif('tudou.com' == $host)
        {
        	//土豆视频解析修改　　editby: nonant 2012-1-19 参考了记事狗解析正则.
			if(preg_match('~(?:(?:[\?\&\#]iid\=)|(?:\d+i))(\d+)~',$link,$defaultIid) )
			{
			    $defaultIid = $defaultIid[1];
			}elseif(preg_match('~(?:(?:\,iid\s*=)|(?:\,defaultIid\s*=)|(?:\.href\)\s*\|\|))\s*(\d+)~',$content,$defaultIid) )
			{
				$defaultIid = $defaultIid[1];
			}
			
			if( $defaultIid ){
				preg_match('~'.$defaultIid.'.*?icode\s*[\:\=]\s*[\"\']([\w\d\-\_]+)[\"\']~s',$content,$flashvar);
				preg_match('~'.$defaultIid.'.*?title\s*[\:\=]\s*[\"\']([^\"\']+?)[\"\']~s',$content,$title);
				preg_match('~'.$defaultIid.'.*?pic\s*[\:\=]\s*[\"\']([^\"\']+?)[\"\']~s',$content,$img);
				$title[1] = iconv("GBK","UTF-8",$title[1]);
			}
        }
        elseif('youtube.com' == $host) {

        }
        elseif('5show.com' == $host) {

        }
        elseif('sohu.com' == $host) {
            preg_match("/vid=\"(.*?)\"/", $content, $flashvar);
            preg_match('/cover="([^"]+)";/', $content, $img);
            preg_match("/<title>(.*?)<\/title>/", $content, $title);
            $title[1] = iconv("GBK","UTF-8",$title[1]);
        }
        elseif('mofile.com' == $host)
        {
            preg_match("/\/([\w\-]+)\.shtml/",$link,$flashvar);
            preg_match("/thumbpath=\"(.*?)\";/i",$content,$img);
            preg_match("/<title>(.*?)<\/title>/i",$content,$title);
        }

        $return['flashvar'] = $flashvar[1];
        $return['img']   = $img[1];
        $return['title'] = $title[1];
        return $return;
    }
}
