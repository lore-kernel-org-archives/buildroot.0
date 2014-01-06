From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 06 Jan 2014 21:50:00 +0100
Subject: [Buildroot] [PATCH 00/36] Update xorg packages
References: <BLU0-SMTP322F0B0DA043619A8E91DA1D9B50@phx.gbl>
 <52CA9400.4050307@trzebnica.net>
Message-ID: <nghrpaxv56.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Czesc,

Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
wrote in news:52CA9400.4050307 at trzebnica.net: 

> Did you intentionally not bump
> 
> xlib_libFS to version 1.0.5
> xlib_libXaw to version 1.0.12
> xlib_libXcursor to version 1.1.14
> xlib_libXpm to version 3.5.11
> xlib_libXres to version 1.0.7
> xlib_libXv to verrsion 1.0.10
> xlib_libXxf86dga to version 1.1.4
> xlib_libdmx to version 1.1.3

yes, xbmc does not depend on them ;)

Currently I am sending my patch pile needed to compile xbmc Gotham[1] for 
inclusion in buildroot, so I am concentrating on those patches.
Hereby I am closely following the OpenELEC project.

Nonetheless I just sent a new patchset updating the patches mentioned by you, 
compile tested using this defconfig, randomly taken from autobuild:

http://autobuild.buildroot.net/results/24f/24f1ffe788ef50470551f440b2fc71ce1c
5c75e3/defconfig

Regards, Bernd

[1] xbmc now has uclibc-compatability:
    https://github.com/xbmc/xbmc/pull/3920 :)
