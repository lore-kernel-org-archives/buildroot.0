From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 10:38:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: bump
 version to 1.20.6
In-Reply-To: <20191206183440.14737-1-bernd.kuhls@t-online.de>
References: <20191206183440.14737-1-bernd.kuhls@t-online.de>
Message-ID: <20191216103811.67f909e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 19:34:40 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patches 0006 & 0007 which were applied upstream as single
> commit on the server-1.20-branch branch:
> https://gitlab.freedesktop.org/xorg/xserver/commit/07efd81b819f21046afc0bb7e19a6cdf7f3c7ea9
> 
> Updated upstream URL for patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I have no idea if the version bump is the reason for that, but we are
seeing a build failure of the xserver at:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314334

1407 In file included from xf86Init.c:81:
1408 ../../../include/glxvndabi.h:64:10: fatal error: GL/glxproto.h: No such file or directory
1409  #include <GL/glxproto.h>

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
