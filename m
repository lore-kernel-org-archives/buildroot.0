From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 2 Jan 2009 23:44:58 +0100
Subject: [Buildroot] REQ: U-Boot Update on the Atmel Devices
	(at91sam9261)
References: <BAY124-W4592D0A695B7609A243BCDD2F50@phx.gbl>
Message-ID: <19563535EA324C05B0DBC9D3D5F8D064@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  ----- Original Message ----- 
  From: Quick X 
  To: buildroot at uclibc.org 
  Sent: Wednesday, December 17, 2008 12:13 AM
  Subject: [Buildroot] REQ: U-Boot Update on the Atmel Devices (at91sam9261)


  I see "ninevolz" tried to update the Atmel U-Boot to the 1.3.x version almost a year ago but it was reverted by ulf (bad patch).  U-Boot 1.2.0 is pretty old (~2 years) and the newest U-Boot works for Atmel devices.
   
  Sam4Linux updated to 1.3.4 (http://www.linux4sam.org/twiki/bin/view/Linux4SAM/U-Boot) and it works perfectly on my board.
  Denx.de (http://www.denx.de/wiki/U-Boot/Custodians) has the u-boot-at91 git tree that I use and it works perfectly on my board.
  Buildroot seems to be stuck at 1.2.0 eventhough 1.3.x (at91 version) has been around for about a year now.
   
  Just a low-priority request since anyone can pretty easily include the 1.3.x version manually with their buildroot, not sure exactly what would have to be changed but it'd be nice if buildroot included it.  Thanks


The 1.2.0-atmel has some other features which I would like to keep.
This includes support for AT91RM9200EK and some extra commands.
I was working on that 6 weeks ago when my Linux Desktop PC crashed in a strange way.
Home directory was empty, but occupied 80 GB !!!.

Only had time to look at this last week, and realized that one of the SDRAMs, was bad.
Got a new SDRAM, upgraded the hard disk and installed OpenSuSE 11.1 
yesterday, so I might have a chance to do something during the weekend.

We should however go for 2008.10 instead of 1.3.4 which is a little older.

Best Regards
Ulf Samuelsson





------------------------------------------------------------------------------



------------------------------------------------------------------------------


  _______________________________________________
  buildroot mailing list
  buildroot at uclibc.org
  http://busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090102/5f1f24a8/attachment.htm 
