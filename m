From: anthony henderson <development@fair-games.com>
Date: Mon, 9 Aug 2010 13:05:25 +0100
Subject: [Buildroot] setting a driver in directfb through buildroot
Message-ID: <AANLkTi=_+g2q3yxoF+hH18vYPsWZXFq25nYwUf118WQ1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I hope someone can help me out on this.
I've compiled my rootfs in build root with directfb set.  I'm using a cirrus
logic FB93xx, which as far as I can see it has a driver.  I can't see any
way of setting the driver in make menuconfig.  I can however see in the
directory buildroot/package/directfb a file called config.in.  Can I set
here?  If so can anyone tell me what to put in for the EP93XX driver, I
can't find anything documented?  I have tried setting from my ARM system
using the directfb-config  with
directfb-config --graphics=ep93xx.  This doesn't work.  I just says driver
none.

I think I need the correct driver as directfb examples are crashing with
directfbcreate(&dfb) initialization error!

Thanks in advace :)

-- 
Regards Tony
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100809/d7b69a78/attachment.html>
