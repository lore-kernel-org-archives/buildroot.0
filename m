From: Kees van Unen <Keesvanunen@hotmail.com>
Date: Sat, 21 Oct 2017 04:10:34 -0700 (MST)
Subject: [Buildroot] Implicit declaration of mblen
Message-ID: <1508584234482-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using buildroot-2017.08 and I want to use X.org. When compiling
xlib_libX11-1.6.5 there is an error in imCallbk.c: implicit declaration of
function mblen. By adding a -I reference to CFLAGS in the relevant Makefile
to stdlib.h this source compiles. This happens for a number of X11 sources.
Does anybody knows how this can be solved with Buildroot?

The mblen bug also appears later on in the process when it tries to use
xlib_libx.so.

Thank you.




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
