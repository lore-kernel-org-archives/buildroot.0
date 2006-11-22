From: Michael K. Edwards <medwards.linux@gmail.com>
Date: Wed, 22 Nov 2006 09:08:36 -0800
Subject: [Buildroot] 'ld' gives "unrecognised emulation mode" - ARM
	toolchain unbuildable ??
In-Reply-To: <loom.20061122T095656-727@post.gmane.org>
References: <loom.20061101T111436-827@post.gmane.org>
	<loom.20061102T152239-949@post.gmane.org>
	<loom.20061121T200844-447@post.gmane.org>
	<f2b55d220611211208yef912b8p4c00bfd2ee2a2eca@mail.gmail.com>
	<loom.20061122T095656-727@post.gmane.org>
Message-ID: <f2b55d220611220908v2a8699bt61a298dbf3fcf100@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Did I say armelf-linux-eabi?  Silly me.  What's working for me (with
glibc and crosstool) is armelf-linux-gnueabi.  I'm almost done
scrubbing cross-configure problems out of my ptxdist userland and will
start banging on uClibc/buildroot today; I'll let you know what I
find.

Cheers,
- Michael
