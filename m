From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Sep 2013 18:19:58 +0200
Subject: [Buildroot] [PATCH] gcc-initial: Add host-elf2flt dependency
 when BR2_PACKAGE_HOST_ELF2FLT=y
In-Reply-To: <1378307915.5313.1.camel@phoenix>
References: <1378307915.5313.1.camel@phoenix>
Message-ID: <20130904181958.36251b69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Wed, 04 Sep 2013 23:18:35 +0800, Axel Lin wrote:
> It's needed for some uClibc combination, link-flat.so which uses elf2flt
> pulls in libgcc according to uclibc/Makerules (used in uclibc/libc/Makefile.in).
> Thus pull it in for gcc-initial.
> 
> This also ensures elf2flt is ready when BR2_PACKAGE_HOST_ELF2FLT=y before
> building other packages.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
