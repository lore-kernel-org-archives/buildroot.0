From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 3 Jun 2013 13:05:53 -0700
Subject: [Buildroot] EGL Confusion
Message-ID: <CALo-6+g+z8xV9bnzbF6MAB0VUEzO-mkYocHvVM=GziSmyFAk5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Either my understanding of buildroot is incomplete (most likely) or
buildroot is incomplete (least likely), but in either case, I would
appreciate a bit of advice.

I am moving a TI AM3517 design from last springs buildroot to the
lastest buildroot in order to go from Qt-4.8.2 to Qt-5.0.2 and I can
build a reasonable rootfs unless I try to configure QtDeclarative
which is grayed out.

In looking into why it is grayed out, it seems to have to do with
BR2_PACKAGE_HAS_OPENGL_EGL which is also grayed out as I am not on a
Raspberry Pi.

My need is to reference the external EGL supplied by TI in their
Graphics_SDK and I was hoping that we have a way to get from here to
there and would appreciate any advice on the path with the least
problems.

-- 
Charles Krinke
