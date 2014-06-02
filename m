From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Jun 2014 23:00:10 +0200
Subject: [Buildroot] simple xtensa build fails
In-Reply-To: <20140602064030.GB4473@tarshish>
References: <20140602062354.GB4197@waldemar-brodkorb.de>
 <20140602064030.GB4473@tarshish>
Message-ID: <20140602230010.591ed0c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 2 Jun 2014 09:40:30 +0300, Baruch Siach wrote:
> Hi Waldemar,
> 
> On Mon, Jun 02, 2014 at 08:23:54AM +0200, Waldemar Brodkorb wrote:
> > a simple Xtensa build fails:
> >  CC libc/sysdeps/linux/common/posix_fadvise.os
> > libc/sysdeps/linux/common/posix_fadvise.c:26:29: error: unknown type
> > name 'off64_t'
> > libc/sysdeps/linux/common/posix_fadvise.c:26:45: error: unknown type
> > name 'off64_t'
> > libc/sysdeps/linux/common/posix_fadvise.c: In function
> > 'posix_fadvise':
> > libc/sysdeps/linux/common/posix_fadvise.c:32:2: warning: implicit
> > declaration of function 'posix_fadvise64'
> > [-Wimplicit-function-declaration]
> > make[1]: *** [libc/sysdeps/linux/common/posix_fadvise.os] Error 1
> > make[1]: Leaving directory
> > `/home/wbx/br/output/build/uclibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c'
> > make: ***
> > [/home/wbx/br/output/build/uclibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c/.stamp_built]
> > Error 2
> 
> Snapshot uClibc build without LFS is currently broken. See 
> http://article.gmane.org/gmane.comp.lib.uclibc.general/23714 for a fix.

Should we integrate this patch in our Xtensa and ARC uClibc patch
series?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
