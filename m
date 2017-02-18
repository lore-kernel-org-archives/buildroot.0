From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Feb 2017 19:21:29 +0100
Subject: [Buildroot] [PATCH] package/sngrep: add missing ncurses
	dependencies
References: <20170218154333.24496-1-romain.naour@gmail.com>
 <20170218164928.59e0f1c5@free-electrons.com>
Message-ID: <XnsA720C4EB5F912berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20170218164928.59e0f1c5 at free-electrons.com:

> However, I still don't understand how it can fail on the autobuilders.

because the autobuilders fail with BR2_PACKAGE_NCURSES_WCHAR=y:
http://lists.busybox.net/pipermail/buildroot/2017-January/182468.html

Regards, Bernd
