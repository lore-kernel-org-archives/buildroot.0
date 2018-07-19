From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 14:27:17 +0200
Subject: [Buildroot] [PATCH v2 0/3] Hardening build flags fixes
In-Reply-To: <1531998123-28360-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1531998123-28360-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <20180719142717.62a09ca7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

On Thu, 19 Jul 2018 13:02:00 +0200, Stefan S?rensen wrote:
> This series provides a number of fixes and cleanups of the build flags
> releated to hardened builds.
> 
> Changes v1->v2:
>   * Drop patch removing linker flags from TARGET_CFLAGS
>   * Use a single spec file for compiler and linker flags
> 
> Stefan S?rensen (3):
>   package/Makefile.in: Do not use CPPFLAGS for hardening options
>   package/Makefile.in: Add missing options to LDFLAGS for full RELRO
>     build
>   package/Makefile.in: Use gcc spec files for PIE build flags

These patches were also sent by Matt Weber recently, the first two got
Reviewed-by from Arnout, the third one has questions:

  http://patchwork.ozlabs.org/project/buildroot/list/?series=54943

I'm a bit confused as to which patches to apply. Are your patches
unchanged compared to what Matt Weber sent ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
