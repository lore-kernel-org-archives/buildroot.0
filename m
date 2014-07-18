From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Jul 2014 17:11:52 +0200
Subject: [Buildroot] [PATCH 2/2] xf86-video-intel: Bump version to
	2.99.912
References: <1405661249-6506-1-git-send-email-ben@bwidawsk.net>
 <1405661249-6506-2-git-send-email-ben@bwidawsk.net>
Message-ID: <XnsA36EAEF1EB0D1berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben Widawsky <ben@bwidawsk.net> wrote in 
news:1405661249-6506-2-git-send-email-ben at bwidawsk.net:

> Warning: I've only built this. Not run it.
> 
> Cc: Bernd Kuhls <berndkuhls@hotmail.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Ben Widawsky <ben@bwidawsk.net>

Hi,

the OpenELEC team reverted this version bump last month, reason unknown:
https://github.com/OpenELEC/OpenELEC.tv/commit/8f4fd1a758da169c95816de4dc5c50
1fa268746c

Therefore I currently stayed away from this release, please see my patch to 
bump version to its predecessor 2.99.911[1]. I am awaiting the next release 
of this driver and will test again, so for today: NAK.

Regards, Bernd

[1] http://patchwork.ozlabs.org/patch/370975/
