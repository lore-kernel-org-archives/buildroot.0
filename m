From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 21:38:45 +0200
Subject: [Buildroot] [git commit] xenomai: bump version to 3.0.3
In-Reply-To: <20170326123433.GL22954@waldemar-brodkorb.de>
References: <20170325181551.035B88226E@busybox.osuosl.org>
 <20170326123433.GL22954@waldemar-brodkorb.de>
Message-ID: <20170326213845.279e722b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Mar 2017 14:34:33 +0200, Waldemar Brodkorb wrote:

> is this well tested?
> Simple uClibc-ng for ARM breaks with:
> obstack.c:103:24: fatal error: exitfail.h: No such file or directory

I did do a build test (since I added a patch to make things build
properly), but I don't remember if it was a glibc or uClibc build.
Apparently, it was a glibc build.

> I am not an Xenomai expert, just started experimenting with it, but
> I see no option to switch between "cobalt" and "mercury" mode.

$ ./configure --help
[...]
  --with-core=<cobalt | mercury>
                          build for dual kernel or single image

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
