From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Sun, 26 Aug 2018 05:11:37 -0600
Subject: [Buildroot] SDL2+directfb combo does not work as built by
 buildroot-2018.02.3
Message-ID: <CAGrGpJDVHStp8MUZaGb1=ZfWud-k4fQP=piwsc-QfftCDFyKog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I cannot get directfb + SDL2 working on Beaglebone Black  (see Bugzilla
#4232 and SDL forums)
    https://bugzilla.libsdl.org/show_bug.cgi?id=4232
    https://discourse.libsdl.org/u/PeterThompson/activity

I do not want to use X windows for the video driver.  I tried adding OpenGL
ES to the rootfs but for that I need efl which in turn needs the kernel
built by Buildroot.  I have a working kernel which I want to work on
separately to attach a new display and prefer not to be forced to always
build it through Buildroot.

Suggestions?

Note: SDL2+directfb combo used to work on igepv2 buildroot-2015.08.1.   I
am just trying to migrate to the beaglebone black.


Peter Thompson
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180826/5bf3a581/attachment.html>
