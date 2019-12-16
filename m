From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 16 Dec 2019 21:03:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: bump
 version to 1.20.6
References: <20191206183440.14737-1-bernd.kuhls@t-online.de>
 <20191216103811.67f909e1@windsurf.home>
Message-ID: <oh4lcgxftm.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 16 Dec 2019 10:38:11 +0100 schrieb Thomas Petazzoni:

> I have no idea if the version bump is the reason for that, but we are
> seeing a build failure of the xserver at:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/378314334
> 
> 1407 In file included from xf86Init.c:81:
> 1408 ../../../include/glxvndabi.h:64:10: fatal error: GL/glxproto.h: No
> such file or directory 1409  #include <GL/glxproto.h>

Hi Thomas,

the error was caught by autobuilders before:

http://autobuild.buildroot.net/results/4df/
4df03009e25c1bddfd666f58bddf20e5cd6e80ef/

but I can not reproduce the error with this defconfig.

Regards, Bernd
