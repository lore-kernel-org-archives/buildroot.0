From: manu f <e.fiancette@gmail.com>
Date: Sun, 31 Jan 2021 19:15:00 +0100
Subject: [Buildroot] qt5 "Could not find DRM device"
Message-ID: <CAGshWo2DDqef=WG6MatpYHTxyNx=p4j+XxR-iEXSiE76anz4pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I build a kernel for imx6 board. imx6 boot correctly, but  I got this
error  "Could not find DRM device" when I try to launch a qt web browser (
this app working on an other context).

I search google and mailing list. I find something about qt5 configuration
and -device flag..
Could I have some help about ?

(qt app depend on qt5 webengine, so I set mesa3d and perhaps I made a
mistake when setting drivers, because I use direct frame buffer.. perhaps I
forgot something)

Regards.

Emmanuel

(you will find here my .config.)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210131/8cf59360/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 134584 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210131/8cf59360/attachment-0001.obj>
