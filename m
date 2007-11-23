From: Atle Nissestad <atle@nissestad.no>
Date: Fri, 23 Nov 2007 12:03:17 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain:
	binutils/2.15 elf2flt gcc gcc/3.4.6
In-Reply-To: <20071123103255.0E2503004A@busybox.net>
References: <20071123103255.0E2503004A@busybox.net>
Message-ID: <200711231203.17512.atle@nissestad.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 23. November 2007 11:32:55 vanokuten at uclibc.org wrote:
> Author: vanokuten
> Date: 2007-11-23 02:32:50 -0800 (Fri, 23 Nov 2007)
> New Revision: 20492
>
> Log:
> update the nios2-patches for binutils-2.15 and gcc-3.4.6 with the latest
> sources from Altera, and removes obsolete patches
>
> Modified:
>    trunk/buildroot/toolchain/binutils/2.15/700-nios2-2.15.patch
>    trunk/buildroot/toolchain/binutils/2.15/701-nios2-gcc4-buildfix.patch
>    trunk/buildroot/toolchain/elf2flt/elf2flt.nios2.conditional
>    trunk/buildroot/toolchain/gcc/3.4.6/900-nios2.patch
>    trunk/buildroot/toolchain/gcc/3.4.6/901-nios2-ctor_dtor.patch
>    trunk/buildroot/toolchain/gcc/3.4.6/nios2-config-fix.patch.conditional
>    trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
>
Thanks for merging my changes so quickly!
There is however a small issue with this commit. The following files should be 
removed (they are empty):

trunk/buildroot/toolchain/binutils/2.15/701-nios2-gcc4-buildfix.patch
trunk/buildroot/toolchain/gcc/3.4.6/901-nios2-ctor_dtor.patch
trunk/buildroot/toolchain/gcc/3.4.6/nios2-config-fix.patch.conditional

- Atle
