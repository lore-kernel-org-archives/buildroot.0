From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Mar 2010 20:24:42 +0100
Subject: [Buildroot] external toolchain and sysroot
In-Reply-To: <hoh171$jf0$1@dough.gmane.org>
References: <1272730299.20100325182803@ya.ru> <hog24r$1nu$1@dough.gmane.org>
	<93399903.20100325201240@ya.ru> <44830928.20100325201616@ya.ru>
	<hog8rg$sis$1@dough.gmane.org> <20100325233452.3794166b@surf>
	<hoh171$jf0$1@dough.gmane.org>
Message-ID: <20100326202442.7ef0e1ae@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 26 Mar 2010 01:04:33 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> >  * We pass --sysroot $(STAGING_DIR) to every gcc/ld invocation, so that
> >    gcc/ld find the libraries and header files correctly.
> 
> Perhaps that's what's supposed to happen, but there appear to be a lot
> of packages where it doesn't happen (at least for some of us).

As I said in my other mail in this thread, yes, there are many packages
that are broken with regard to --sysroot. Packages that use the
Makefile.autotools.in infrastructure should all work, but for all the
other packages, they should be fixed one by one.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
