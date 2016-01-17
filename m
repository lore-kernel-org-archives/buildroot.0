From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jan 2016 15:40:51 +0100
Subject: [Buildroot] pixman-0.33.4 fails on Error: bad instruction `int
 __flt_rounds(void)' for musl rpi2 build
In-Reply-To: <569B48D0.4050007@scalemp.com>
References: <569B48D0.4050007@scalemp.com>
Message-ID: <20160117154051.11936eeb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eial,

On Sun, 17 Jan 2016 09:54:56 +0200, Eial Czerwacki wrote:

> I'm trying to build a basic musl based image for my rpi2 that has
> openbox in it and it keeps failing on
> pixman-0.33.4 with the error mentioned above.
> 
> my config can be found here: http://paste.ubuntu.com/14543009/
> 
> any ideas how to fix it?

Thanks for reporting the problem. I have just sent a patch (I Cc'ed
you) which fixes this problem. It would be great if you could test it
and tell us if it fixes the problem for you.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
