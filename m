From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Thu, 5 Apr 2012 23:54:03 +0200
Subject: [Buildroot] customizing xorg package
Message-ID: <CALB96NmatmTxO=ZuOo_DVkw6bCBs19f9BuDDgWr_cSHn-OgE9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi there,

i am starting to look into building a distro with X and h/w accelerated
drivers for pandaboard, with buildroot. i never really built Xorg with
buildroot before. so after looking around, it seems that buildroot has
packages ready for X11R7.6. however i would need to use 7.6 with some
customization, like a more recent xserver version. debian/ubuntu allow such
combination because they build each X component using the 'individual'
releases, instead of the global X11R7.x release.

so my questions are:

- has anyone already tried to build a modular X11 with  buildroot with
similar customization (e.g. from individual packages, not full release)?
- would that be interesting to get that into buildroot (assuming I or
someone here can come up with the patches for this...)?
- if there is an interest, has someone thought about the best way to do
that? i can try to give this some thinking, but if there is some work i can
reuse it's always better...

thx

nico
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120405/b7ede44d/attachment.html>
