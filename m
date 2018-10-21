From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 20:12:58 +0200
Subject: [Buildroot] [PATCH] package binutils: remove binutils 2.27
 patches
In-Reply-To: <20181021175331.16048-1-romain.naour@gmail.com>
References: <20181021175331.16048-1-romain.naour@gmail.com>
Message-ID: <20181021201258.3d516d23@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 19:53:31 +0200, Romain Naour wrote:
> binutils 2.27 support was removed with [1]
> 
> [1] 453d29f1f45736d0156071930a09015def68994a
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> This patch must be backported to 2018.02 and 2018.08.
> ---
>  .../2.27/0100-elf32-arm-no-data-fix.patch     |  22 --
>  package/binutils/2.27/0120-sh-conf.patch      |  46 ---
>  ....c-fixup-xg_reverse_shift_count-typo.patch |  33 --
>  ...-memory-corruption-by-broken-sysregs.patch |  42 ---
>  package/binutils/2.27/0300-ld-makefile.patch  |  41 ---
>  .../2.27/0301-check-ldrunpath-length.patch    |  36 ---
>  .../0500-add-sysroot-fix-from-bug-3049.patch  |  52 ---
>  .../2.27/0600-poison-system-directories.patch | 306 ------------------
>  ...dynamic-tag-VMA-and-size-from-dynami.patch |  36 ---
>  .../2.27/0906-microblaze-pr21180.patch        |  33 --
>  ...able-CRC-instructions-on-supported-A.patch |  88 -----
>  11 files changed, 735 deletions(-)
>  delete mode 100644 package/binutils/2.27/0100-elf32-arm-no-data-fix.patch
>  delete mode 100644 package/binutils/2.27/0120-sh-conf.patch
>  delete mode 100644 package/binutils/2.27/0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch
>  delete mode 100644 package/binutils/2.27/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch
>  delete mode 100644 package/binutils/2.27/0300-ld-makefile.patch
>  delete mode 100644 package/binutils/2.27/0301-check-ldrunpath-length.patch
>  delete mode 100644 package/binutils/2.27/0500-add-sysroot-fix-from-bug-3049.patch
>  delete mode 100644 package/binutils/2.27/0600-poison-system-directories.patch
>  delete mode 100644 package/binutils/2.27/0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch
>  delete mode 100644 package/binutils/2.27/0906-microblaze-pr21180.patch
>  delete mode 100644 package/binutils/2.27/0907-Automatically-enable-CRC-instructions-on-supported-A.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
