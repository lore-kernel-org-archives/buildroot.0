From: Eial Czerwacki <eial@scalemp.com>
Date: Sun, 17 Jan 2016 09:54:56 +0200
Subject: [Buildroot] pixman-0.33.4 fails on Error: bad instruction `int
 __flt_rounds(void)' for musl rpi2 build
Message-ID: <569B48D0.4050007@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I'm trying to build a basic musl based image for my rpi2 that has
openbox in it and it keeps failing on
pixman-0.33.4 with the error mentioned above.

my config can be found here: http://paste.ubuntu.com/14543009/

any ideas how to fix it?

Thanks.
