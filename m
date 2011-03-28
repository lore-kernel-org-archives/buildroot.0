From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2011 00:03:23 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile.autotools.in: add
 libtool v2.4 support
In-Reply-To: <20110328194623.C0431819DC@busybox.osuosl.org>
References: <20110328194623.C0431819DC@busybox.osuosl.org>
Message-ID: <20110329000323.77c0d0d0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Mar 2011 21:45:06 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> Packages (like avahi) are now using libtool 2.4, so extend the libtool
> handling to support those as well.

I thought libtool v2.4 was supposed to support --sysroot and therefore
to not need any of our dirty cross-compilation tricks. Am I wrong ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
