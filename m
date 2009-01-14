From: Dan Lyke <danlyke@flutterby.com>
Date: Wed, 14 Jan 2009 08:42:46 -0800
Subject: [Buildroot] Searching for the right "make clean"
Message-ID: <20090114084246.42473a62@danhplaptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Silly question:

I'm using buildroot for an AT91SAM9261, and was getting some floating
point behavior I didn't understand, so rather than be all smart about
it I decided to force software floating point and rebuild my toolchain.

Simply checking that box under "Toolchain" in the "make menuconfig",
followed by "make clean; make" failed with errors that things were
compiled with hardware floating point, so I grepped the Makefile for
"clean", tried "make dirclean", that failed, and then did a "make
distclean" which blew away more than I wanted to.

What's the right "clean" for me to have typed?

Thanks.

Dan
