From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 16:07:01 +0200
Subject: [Buildroot] [PATCH/next] package/bdwgc: bump version to 7.6.0
In-Reply-To: <20170521174103.6779-1-bernd.kuhls@t-online.de>
References: <20170521174103.6779-1-bernd.kuhls@t-online.de>
Message-ID: <20170522160701.0fa79d53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 May 2017 19:41:03 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream:
> 
> 0002-Do-not-include-sigcontext.h-and-asm-sigcontext.h.patch
> https://github.com/ivmai/bdwgc/commit/c887470e0e3310c81ecdb7e736bc5d2ead45db2a
> 
> 0003-Revert-Move-asm-machine-dependent-files-to-src-folde.patch
> https://github.com/ivmai/bdwgc/commit/5e756d4d8df2949cb3b6e51532d3016cbb276fd7
> 
> 0004-configure-match-uclinux-pattern.patch
> https://github.com/ivmai/bdwgc/commit/a628c90bdbf397465ac2ab2b11f14eb2e853651c
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...include-sigcontext.h-and-asm-sigcontext.h.patch |  61 ---
>  ...-asm-machine-dependent-files-to-src-folde.patch | 424 ---------------------
>  .../0004-configure-match-uclinux-pattern.patch     |  32 --
>  package/bdwgc/bdwgc.hash                           |   2 +-
>  package/bdwgc/bdwgc.mk                             |   2 +-
>  5 files changed, 2 insertions(+), 519 deletions(-)
>  delete mode 100644 package/bdwgc/0002-Do-not-include-sigcontext.h-and-asm-sigcontext.h.patch
>  delete mode 100644 package/bdwgc/0003-Revert-Move-asm-machine-dependent-files-to-src-folde.patch
>  delete mode 100644 package/bdwgc/0004-configure-match-uclinux-pattern.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
