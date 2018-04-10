From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 09:36:51 +0200
Subject: [Buildroot] [PATCH] openssh: bump to version 7.7p1
In-Reply-To: <30912a4d4e35df034e4874505dafef48853b16b6.1523339082.git.baruch@tkos.co.il>
References: <30912a4d4e35df034e4874505dafef48853b16b6.1523339082.git.baruch@tkos.co.il>
Message-ID: <20180410093651.388bd5db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 08:44:42 +0300, Baruch Siach wrote:
> Drop upstream patches, renumber the rest.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-configure-ac-detect-mips-abi.patch        | 44 ---------------
>  ...ch => 0001-fix-pam-uclibc-pthreads-clash.patch} |  0
>  ...roperly-set-seccomp-audit-arch-for-mips64.patch | 63 ----------------------
>  ...nclude.patch => 0002-fix-howmany-include.patch} |  0
>  ...pat-bsd-getpagesize.c-include-includes.h-.patch | 35 ------------
>  package/openssh/openssh.hash                       |  4 +-
>  package/openssh/openssh.mk                         |  6 +--
>  7 files changed, 3 insertions(+), 149 deletions(-)
>  delete mode 100644 package/openssh/0001-configure-ac-detect-mips-abi.patch
>  rename package/openssh/{0003-fix-pam-uclibc-pthreads-clash.patch => 0001-fix-pam-uclibc-pthreads-clash.patch} (100%)
>  delete mode 100644 package/openssh/0002-configure-ac-properly-set-seccomp-audit-arch-for-mips64.patch
>  rename package/openssh/{0004-fix-howmany-include.patch => 0002-fix-howmany-include.patch} (100%)
>  delete mode 100644 package/openssh/0005-openbsd-compat-bsd-getpagesize.c-include-includes.h-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
