From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Sat, 24 Nov 2012 01:19:24 -0800 (PST)
Subject: [Buildroot] Qt mouse, keyboard, touchscreen
Message-ID: <1353748764.40553.YahooMailNeo@web164602.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to helpful information you provided, I managed to built
simple Qt application on my ARM board and it works - meaning
I got some window and some simple effect inside. I am using 
framebuffer so started program with?-qws option.
However mouse, keyboard and touchscreen are dead. In fact they 
are probably visible by kernel (ts_calibrate and ts_test for example,
works OK and cat /dev/input/event0 shows "usuall" garbage on 
terminal) however I don't know how to start them to work with Qt.
I successfully started them earlier?while using TinyX and GTK, by
simply quoting them?with xinit command parameters.
But don't know how to do the same with Qt.
?
Regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121124/9db2df41/attachment.html>
