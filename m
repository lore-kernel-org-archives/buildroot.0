From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 30 Mar 2012 16:21:15 +0200
Subject: [Buildroot] x11 and touch screen calibration
Message-ID: <CAGm1_ku7SbH8mbadvcXB5OpZr8=jrUCT=tKJjKXaq7JE2c-RXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a 8" resistive touch screen. The whole stuff is working but
rather inaccurate. ts_calibrate and ts_test give good results and
after patching Android to use pointercal file I have no problems
either.

How do I get X11 to use the values from /etc/pointercal? For now I'm
using fluxbox, but I'm also open to other managers.

Yegor
