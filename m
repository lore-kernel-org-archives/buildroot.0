From: Akpinar, Suleyman <suleyman.akpinar@siemens.com>
Date: Wed, 11 Jun 2008 08:50:34 +0300
Subject: [Buildroot] atngw100 hr timers
Message-ID: <083389D05BE23143A7BDA436E0C730D677244A@TRISTK010MSX.tr001.siemens.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,
 
I am trying to prepare a kernel and usr images for Atmel atngw100 board. I am using buildroot-avr32-v2.1.0 for this purpose, unfortunately this version doesn't allow me to configure kernel to support hr timers with "make linux26-menuconfig". The kernel I must prepare has to support at least 1ms timer resolution. Also, as far as I know, I have to change the kernel vernel version to v2.6.24.atmel.3, v2.6.26-rc1 to achive the required timer response and the buildroot-avr32-v2.1.0 uses v2.6.23 kernel.
 
Is there any way to tell the buildroot to use a particular kernel version?
 
Can anybody please give some tips?
 
Regards,
Suleyman Akp?nar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080611/841d76f6/attachment.htm 
