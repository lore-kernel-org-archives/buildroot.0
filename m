From: Quick X <quickx@hotmail.com>
Date: Tue, 16 Dec 2008 15:13:25 -0800
Subject: [Buildroot] REQ: U-Boot Update on the Atmel Devices (at91sam9261)
Message-ID: <BAY124-W4592D0A695B7609A243BCDD2F50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I see "ninevolz" tried to update the Atmel U-Boot to the 1.3.x version almost a year ago but it was reverted by ulf (bad patch).  U-Boot 1.2.0 is pretty old (~2 years) and the newest U-Boot works for Atmel devices.
 
Sam4Linux updated to 1.3.4 (http://www.linux4sam.org/twiki/bin/view/Linux4SAM/U-Boot) and it works perfectly on my board.
Denx.de (http://www.denx.de/wiki/U-Boot/Custodians) has the u-boot-at91 git tree that I use and it works perfectly on my board.
Buildroot seems to be stuck at 1.2.0 eventhough 1.3.x (at91 version) has been around for about a year now.
 
Just a low-priority request since anyone can pretty easily include the 1.3.x version manually with their buildroot, not sure exactly what would have to be changed but it'd be nice if buildroot included it.  Thanks
_________________________________________________________________

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081216/7586cadc/attachment.htm 
