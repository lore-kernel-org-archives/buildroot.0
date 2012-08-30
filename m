From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Thu, 30 Aug 2012 03:09:46 -0700 (PDT)
Subject: [Buildroot] BR 2012.08: X11 issue
In-Reply-To: <CAGm1_kvCm9G8gonFAXowbA7m16q0EHQzqLLNocOe5cb=+A7h4w@mail.gmail.com>
References: <CAGm1_kvCm9G8gonFAXowbA7m16q0EHQzqLLNocOe5cb=+A7h4w@mail.gmail.com>
Message-ID: <1346321386.49257.YahooMailNeo@web164606.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I also reported some error,?regarding X11, but not?same as yours.
It was
FBDEV(0): FBIOPUT_VSCREENINFO: Invalid argument;
Fatal server error:Addscreen/ScreenInit failed for driver 0-  and later:
xinit: giving up
xinit: unable to connect to X server - no such file or directory
xinit: server error?
My board is old one -Mini2440. However, I gave up on building
modular XOrg and tried (and succeed) with Tiny X.
?
Regards
 

________________________________
 From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot at busybox.net 
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 
Sent: Thursday, August 30, 2012 11:26 AM
Subject: [Buildroot] BR 2012.08: X11 issue
  
For some time I reported about x11 problems with my am3517 based
board. Is anyone using xorg and can reproduce my issue? I'd like to
know if it is OMAP related ot not.

This is the error: (EE) FBDEV(0): internal error: miCreateDefColormap
failed in FBDevScreenInit()

Thomas, you mentioned an "X.org big bump provided by Will Newton".
Where can I find the branch or patches?

Yegor
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120830/91b886b1/attachment.html>
