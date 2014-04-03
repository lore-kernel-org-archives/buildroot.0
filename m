From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:31:04 +0200
Subject: [Buildroot] [PATCH] valgrind: remove default flags -mips32 and
 -mips64 from Makefile.all.am
In-Reply-To: <1396267805-11978-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1396267805-11978-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140403213104.45507785@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

Thanks, I've applied your patch. One small comment below.

On Mon, 31 Mar 2014 13:10:05 +0100, Vicente Olivert Riera wrote:
> During configuration of Valgrind we check does the compiler support
> -march=mips32 and -march=mips64. If compiler supports these flags we are
> using them as default flags for mips32 and mips64.
> 
> "VALGRIND_AUTORECONF = YES" needs to be added to valgrind.mk because
> this patch modifies the configure.ac.
> 
> Original upstream patch:
>    https://github.com/svn2github/valgrind/commit/fdf6c5aea4671c3c43c90230510735d215dd1e1c

This information should also have been part of the patch itself, so
that the next time we bump Valgrind and look at the patches, it is
clear that this patch is already upstream. I've done that before
applying your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
