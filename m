From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 16 Jul 2012 10:40:23 -0700
Subject: [Buildroot] Qt on AM3517EVM
Message-ID: <CALo-6+hhvCkfT_4Rz4POqw5j_BPPLKHZ0saqEyeiKsp-tSJLdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First of all, +100 for Thomas, Arnout and Julian. This morning, I was
able to load the jffs2 compiled file system from buildroot and run
"ts_calibrate" and got a functioning touch screen and color LCD with
Qt on the LogicPD AM3517EVM after *removing* the environment variable
QMAKESPEC which the TI-SDK insisted on adding to my .bashrc.

Of course, no sooner had I gotten it to work then my customer says
"Thats cool, how about Qt5?"

So, ... are we considering either a Qt5 bump or either Qt4/Qt5 with an
xconfig option?

This proves, *again*, that no good deed ever goes unpunished.

-- 
Charles Krinke
