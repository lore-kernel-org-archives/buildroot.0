From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Thu, 25 Nov 2010 14:44:19 +0100
Subject: [Buildroot] AT91SAM9G20 Buildroot Hangs
In-Reply-To: <87ipzl34rq.fsf@macbook.be.48ers.dk>
References: <0C11C5BF0B29FD43A8D0250F711D497F7FB01A662F@ex01-ubitronix.ubitronix.local>
	<AANLkTikmMd6z05CAzXN+e4AM5R4FvcinKgsDJZEOC1Lo@mail.gmail.com>
	<0C11C5BF0B29FD43A8D0250F711D497F7FB01A6631@ex01-ubitronix.ubitronix.local>
	<AANLkTinY7n6ZHH4Ci8A4KwGeZ-5gv0WkTSqY1hPQxuuk@mail.gmail.com>
	<87ipzl34rq.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTik-C=fn6xV=FbNzCtxZQD0Wb2ty+WqK-v5SF4sq@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ?Paulius> # Put a getty on the serial port
> ?Paulius> #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

Tip: If you like to have a simple shell at the console port specified
by kernel cmdline, just enter like this in inittab:

::respawn:-/bin/sh

This will spawn a sh(ell) process at the current console port (but
won't of course ask for password).
