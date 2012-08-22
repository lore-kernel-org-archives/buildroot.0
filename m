From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Wed, 22 Aug 2012 03:50:26 -0700 (PDT)
Subject: [Buildroot] Compiling process
In-Reply-To: <5034B3CC.5070804@relinux.de>
References: <1345630715.32281.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <5034B3CC.5070804@relinux.de>
Message-ID: <1345632626.17520.YahooMailNeo@web164605.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can you tell me, Stephan, what is your developement environment?
Can I use some ordinary?editor to create .c or .cpp file and then 
compile from command line?
Do I have to write some code in Qt related source to react on -qws
option ?
?
Thanks
 

________________________________
 From: Stephan Hoffmann <sho@relinux.de>
To: buildroot at busybox.net 
Sent: Wednesday, August 22, 2012 12:26 PM
Subject: Re: [Buildroot] Compiling process
  

  
Am 22.08.2012 12:18, schrieb Zoran Djordjevic: 
Hello 
>
>Can someone tell me through an example?what compiler line  
>should look like for compiling SomeFile.c (or .cpp) using compiler,  
>built by Buildroot.  
>Also, does Qt need building X server, or it run independently of it ?  
Hi,

I am currently working with QT without X. It runs directly on the
    Linux framebuffer.

Does some window manager have to be installed??  
No, but you have to start the app with the "-qws" option.

Kind regards

Stephan


>
>Best regards  
>
_______________________________________________
buildroot mailing list buildroot at busybox.net http://lists.busybox.net/mailman/listinfo/buildroot  


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64 http://www.relinux.de/ sho at reLinux.de   
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120822/08932ed1/attachment-0001.html>
