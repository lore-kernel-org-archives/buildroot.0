From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 10:30:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-13
In-Reply-To: <20140414075801.GC9805@tarshish>
References: <20140414063009.3F4A6100DD1@stock.ovh.net>
 <20140414065113.GB9805@tarshish> <20140414091533.1a0e16e5@skate>
 <20140414075801.GC9805@tarshish>
Message-ID: <20140414103021.0168d7d3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 14 Apr 2014 10:58:01 +0300, Baruch Siach wrote:

> What's in stdlib.h? As far as I can see, uClibc version 0.9.33 has the 
> rpmatch() declaration under '#if 0'.

#ifdef __USE_SVID
/* Determine whether the string value of RESPONSE matches the affirmation
   or negative response expression as specified by the LC_MESSAGES category
   in the program's current locale.  Returns 1 if affirmative, 0 if
   negative, and -1 if not matching.  */
extern int rpmatch (__const char *__response) __THROW __nonnull ((1)) __wur;
#endif

See
http://free-electrons.com/~thomas/pub/peko-i686-wchar-toolchain.tar.xz
for a tarball of the full toolchain. But you will most likely not be
able to use it: it's built to run on a PowerPC machine :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
