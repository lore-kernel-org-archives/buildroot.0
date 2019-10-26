From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 22:55:20 +0200
Subject: [Buildroot] [PATCH v2 4/4] package/x11r7/xlib_libXvMC: remove
 xlib_libXv dependency
In-Reply-To: <20191005094818.1956334-4-romain.naour@gmail.com>
References: <20191005094818.1956334-1-romain.naour@gmail.com>
 <20191005094818.1956334-4-romain.naour@gmail.com>
Message-ID: <20191026225520.31a9dafa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Oct 2019 11:48:18 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Since libXvMC 1.0.12, xv was removed from xvmc.pc [1].
> 
> [1] https://lists.x.org/archives/xorg-announce/2019-September/003023.html

Seems like it disagrees:

  http://autobuild.buildroot.net/results/305/3051f4fbc1ab725de542a550e4f9eeb3cae385b8/build-end.log

checking for XVMC... no
configure: error: Package requirements (x11 >= 1.6 xext xv xextproto videoproto) were not met:

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
