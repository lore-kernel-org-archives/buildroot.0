From: Michael Toldo <michael.toldo@gmail.com>
Date: Wed, 31 Oct 2018 18:28:27 +0100
Subject: [Buildroot] qt-webkit-kiosk on Raspberry Pi
Message-ID: <CAHS=Uo8ra0EvLoVoRys_F=5Qq=J-8vaJ9e60jL97dwx+zP2oRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just tried to compile the master buildroot for the Raspberry Pi 0 W.
Everything worked well an I was able to boot the image. I wanted to start
the qt-webkit-kiosk but this error occured:






*qt.qpa.plugin: Could not find the Qt platform plugin "eglfs" in ""This
application failed to start because no Qt platform plugin could be
initialized. Reinstalling the application may fix this problem.Available
platform plugins are: linuxfb, minimal, offscreen, vnc.Aborted*

The .config tells me "*eglfs backend available if OpenGL and EGL are
enabled*" but I guess OpenGL and EGL is already supported by the
rpi-userland.

Can somebody please give me a hint?

Regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181031/e70f7276/attachment.html>
