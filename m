From: Niall Parker <stuff@pender.dnsalias.net>
Date: Sun, 29 May 2011 23:20:35 -0700
Subject: [Buildroot] adding libgphoto2
Message-ID: <4DE33733.6090305@pender.dnsalias.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've been using buildroot 2011.02 and was trying to libgphoto2 and was 
following the howto in the docs (also copying the libusb Config.in and 
.mk with tweaks). Unfortunately it wasn't a trivial task and it is 
complaining it needs libltdl ...

> checking dynamic linker characteristics... GNU/Linux ld.so
> checking how to hardcode library paths into programs... immediate
> checking ltdl.h usability... no
> checking ltdl.h presence... no
> checking for ltdl.h... no
> checking that we can compile and link with libltdl... no
> configure: error: cannot compile and link against libltdl
> libgphoto2 requires libltdl (the libtool dl* library),
> but cannot compile and link against it.
> Aborting.

I have enabled libtool in the package selection but evidently the 
autoconf isn't finding it. Any suggestions on where to start ?

Thanks.

                         ... Niall
