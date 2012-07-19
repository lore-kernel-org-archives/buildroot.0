From: =?ISO-8859-1?B?Qmr2cm4=?= Kirchner <bjoern@am-soft.de>
Date: Thu, 19 Jul 2012 15:24:58 +0200
Subject: [Buildroot] Network problem with buildroot 2012.05
Message-ID: <20120719152458.1945a8f6@hp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list,

I built a buildroot system for a Mini2440 system and tried
different configurations for the linux kernel. But with
all configurations tested so far, the network was unusable.
Pinging the device from my developement host let to dropped
packets between 66 to 75 % of the sent packats. There were
also messages about broken or malformed answers received.
To exclude a hardware problem I exchanged network cables.
This did not change anything.

With the linux system supplied by the manufactor of the
Mini2440 system, network worked flawlessly. Also there
were no network problems when the u-boot bootloader was
loaded. Pinging the device then worked without errors.

I also tried ptxdist with the board support package which
is especially designed for the Mini2440. Surprisingly the
same ping problem occured.

I am quite lost here. Does anybody have an idea what can
cause this behaviour or what to test to narrow the cause
down?


Thank you for any help in advance.


Bj?rn
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config-buildroot-2012.05-mini2440
Type: application/octet-stream
Size: 25432 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120719/211ecf22/attachment-0001.obj>
