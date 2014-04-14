From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 14 Apr 2014 11:42:30 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-13
In-Reply-To: <20140414103021.0168d7d3@skate>
References: <20140414063009.3F4A6100DD1@stock.ovh.net>
 <20140414065113.GB9805@tarshish> <20140414091533.1a0e16e5@skate>
 <20140414075801.GC9805@tarshish> <20140414103021.0168d7d3@skate>
Message-ID: <20140414084230.GD9805@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Apr 14, 2014 at 10:30:21AM +0200, Thomas Petazzoni wrote:
> On Mon, 14 Apr 2014 10:58:01 +0300, Baruch Siach wrote:
> > What's in stdlib.h? As far as I can see, uClibc version 0.9.33 has the 
> > rpmatch() declaration under '#if 0'.
> 
> #ifdef __USE_SVID
> /* Determine whether the string value of RESPONSE matches the affirmation
>    or negative response expression as specified by the LC_MESSAGES category
>    in the program's current locale.  Returns 1 if affirmative, 0 if
>    negative, and -1 if not matching.  */
> extern int rpmatch (__const char *__response) __THROW __nonnull ((1)) __wur;
> #endif

Seems to be a patched uClibc.

> See
> http://free-electrons.com/~thomas/pub/peko-i686-wchar-toolchain.tar.xz
> for a tarball of the full toolchain. But you will most likely not be
> able to use it: it's built to run on a PowerPC machine :)

So what is the correct solution for this?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
