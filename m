From: franco chalissery <francoin@rediffmail.com>
Date: 15 May 2009 08:51:06 -0000
Subject: [Buildroot] Login problem for busybox !!
Message-ID: <20090515085106.39162.qmail@f4mail-235-243.rediffmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,I have a issue that i couldn't able login after booting.All the user's including "root" can't login. So i followed the steps below ( from mailing list ) also but no success moreover the /etc/securetty also edited adding ttySAC0 inside.Edit /etc/inittab and comment out any getty's and add this:ttyS0::respawn:-/bin/sh (if you are using a serial port)ortty0::respawn:-/bin/sh (if you are using a regular console)then change the root password:passwd rootI have compiled the kernel using arm-none-linux-gnueabi-gcc and selected arch: arm, subarch:arm920T, and skeleton busybox.I have tried all the combination, if anyone can help me on this point it will be great help for me.Thanks & regardsFranco&nbsp; &nbsp; 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090515/b94271df/attachment.htm>
