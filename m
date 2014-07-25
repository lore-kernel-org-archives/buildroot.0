From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 25 Jul 2014 21:38:58 +0200
Subject: [Buildroot] [PATCH v15 0/9] xbmc: Add support for uClibc, OpenGL,
	libva & optional packages
References: <1406090425-5925-1-git-send-email-bernd.kuhls@t-online.de>
 <20140723221057.2f437a0b@free-electrons.com>
Message-ID: <XnsA375DC3AC2333berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140723221057.2f437a0b at free-electrons.com:

>>   xbmc: Add missing egl-related cflags
> 
> For this one, I'm not sure. Shouldn't XBMC itself be capable of calling
> pkg-config on egl to get the appropriate flags? On the other hand, it's
> true that xbmc.mk already has specific hacks for the RPi.

Hi,

yes, xbmc should use pkg-config, but it does not for egl at rpi:
https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L1047

Regards, Bernd
