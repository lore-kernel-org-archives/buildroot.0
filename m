From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Jul 2014 20:31:00 +0200
Subject: [Buildroot] [PATCH 2/2] xf86-video-intel: Bump version to
	2.99.912
References: <1405661249-6506-1-git-send-email-ben@bwidawsk.net>
 <1405661249-6506-2-git-send-email-ben@bwidawsk.net>
 <XnsA36EAEF1EB0D1berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <XnsA373D0B553666berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:XnsA36EAEF1EB0D1berndkuhlsPkbjNfxxIA at bernd-kuhls.de:

> Therefore I currently stayed away from this release, please see my patch to 
> bump version to its predecessor 2.99.911[1]. I am awaiting the next release 
> of this driver and will test again, so for today: NAK.

Hi,

I just tried 2.99.914 for a short test, the screen stayed black after two 
reboots, so I reverted back to 2.99.911. Currently I am lacking the time to 
debug, but I saw no obvious (dmesg, xorg.log) error messages.

Regards, Bernd
