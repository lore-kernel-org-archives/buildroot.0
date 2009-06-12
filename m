From: laurent laffont <laurent.laffont@gmail.com>
Date: Fri, 12 Jun 2009 10:24:02 +0200
Subject: [Buildroot] GTK2 / pango / cairo and libX11 dependencies
Message-ID: <4a339d7c0906120124u4f4499e5n815f481577bf0da0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We want to cross-compile midori for ARM with buildroot, thus GTK2 / pango /
cairo stuff. We faces many problems due to missing X11 dependencies :
libX11, libXext ... that are not compiled for HOST, so libgtk2-2.12.12-host
compilation fails:

checking for XOpenDisplay... no
configure: error: *** libX11 not found. Check 'config.log' for more details.

We have selected tinyX and xorg-server.

Is buildroot supposed to compile GTK2 flawlessly ? Which version do you use
? We currently use buildroot-2009.05-rc1

Thanks for help.

Laurent Laffont
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090612/27349d66/attachment.htm>
