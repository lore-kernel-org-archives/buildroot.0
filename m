From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Thu, 19 Jul 2018 12:51:22 +0000
Subject: [Buildroot] [PATCH v2 0/3] Hardening build flags fixes
In-Reply-To: <20180719142717.62a09ca7@windsurf>
References: <1531998123-28360-1-git-send-email-stefan.sorensen@spectralink.com>
 <20180719142717.62a09ca7@windsurf>
Message-ID: <6fe6f1f90ca7940fd818409e16a334d5697a874e.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2018-07-19 at 14:27 +0200, Thomas Petazzoni wrote:
> Hello Stefan,
> 
> On Thu, 19 Jul 2018 13:02:00 +0200, Stefan S?rensen wrote:
> > This series provides a number of fixes and cleanups of the build
> > flags
> > releated to hardened builds.
> > 
> > Changes v1->v2:
> >   * Drop patch removing linker flags from TARGET_CFLAGS
> >   * Use a single spec file for compiler and linker flags
> > 
> > Stefan S?rensen (3):
> >   package/Makefile.in: Do not use CPPFLAGS for hardening options
> >   package/Makefile.in: Add missing options to LDFLAGS for full
> > RELRO
> >     build
> >   package/Makefile.in: Use gcc spec files for PIE build flags
> 
> These patches were also sent by Matt Weber recently, the first two
> got
> Reviewed-by from Arnout, the third one has questions:
> 
>   http://patchwork.ozlabs.org/project/buildroot/list/?series=54943
> 
> I'm a bit confused as to which patches to apply. Are your patches
> unchanged compared to what Matt Weber sent ?

I had also modified the first two patches, so i dropped the Reviewed-by 
from them. But in the end i ditched the changes so that they are now
unchanged from what Matt posted, but forgot to put back the Reviewed-
by.

As far as I can see, all the questions on the third patch was answered
/ addressed.


Stefan
