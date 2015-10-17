From: Jay <devbon@naver.com>
Date: Sun, 18 Oct 2015 08:31:46 +0900 (KST)
Subject: [Buildroot] =?utf-8?q?What_environment_do_I_need_for_event_input?=
 =?utf-8?q?=3F?=
Message-ID: <11e8982a7594f3e29171373bc8a2b26@cweb29.nm.nhnsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I need "/dev/input/event*" for irda remote controler.
?I tested kernel 4.1.7 and buildroot 2015.08.1.  
?Of course, on custon kernel configuration, I enabled "Device Drivers --&gt; Input device suppor --&gt; Event interface"
?I have tested budilroot system configuration. ie) like these combinations 
?Init system ("systemd") /dev managaement (auto selected with udev)
?Init system ("Busybox") /dev management ("Dynamic using devtmpfs only")
?Init system ("Busybox") /dev management ("Dynamic using mdev")
?Init system ("Busybox") /dev management ("Dynamic using eudev")
? 
?And, Init system ("Busybox") /dev management ("Static using device table")
?In case of using "Static device table", in directory of "output/taget/dev/input/" exists,  
?but, on target system still does not show.
 
?Best,
?Jay 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151018/e3efffbe/attachment.html>
