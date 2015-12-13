From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:45:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d-demos: Disable glesv1
 support
In-Reply-To: <1450030352-31812-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450030352-31812-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213224546.6113c0a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 13 Dec 2015 19:12:32 +0100, Bernd Kuhls wrote:
> The only files enabled by glesv1 support are in src/egl/opengles1/
> 
> Quoting src/egl/opengles1/Makefile.am:
> 
> Most of the files present in this directory contain

I don't see this sentence in src/egl/opengles1/Makefile.am, and this
sentence is not complete, so I don't understand. Was there a copy and
paste error here ?

> which breaks a wayland-only build because the build system does not take
> care of the x11 dependency here. Since these files are "not too
> interesting" anyway we just disable glesv1 support. Also remove a copy-
> and-paste artifact from 0001-demos-optional-gl.patch.

The 0001-demos-optional-gl.patch should probably be part of a separate
patch. Also, would you have some time to submit this patch upstream ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
