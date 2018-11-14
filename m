From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Nov 2018 11:50:30 +0100
Subject: [Buildroot] [PATCH v3 1/2] ell: bump version to 0.14
In-Reply-To: <20181109231725.20059-1-ps.report@gmx.net>
References: <20181109231725.20059-1-ps.report@gmx.net>
Message-ID: <20181114115030.34c8e537@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Nov 2018 00:17:24 +0100, Peter Seiderer wrote:
> - remove superseeded patch 0001-ell-signal.h-use-standard-sigset_t-fixes-musl-compil.patch
> - add patch for missing l_genl_family_set_unicast_handler symbol export
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v2 -> v3:
>   - new patch (needed by iwd update to 0.11)
> ---
>  ...missing-l_genl_family_set_unicast_ha.patch | 30 ++++++++++
>  ...-standard-sigset_t-fixes-musl-compil.patch | 57 -------------------
>  package/ell/ell.hash                          |  2 +-
>  package/ell/ell.mk                            |  2 +-
>  4 files changed, 32 insertions(+), 59 deletions(-)
>  create mode 100644 package/ell/0001-ell-ell.sym-add-missing-l_genl_family_set_unicast_ha.patch
>  delete mode 100644 package/ell/0001-ell-signal.h-use-standard-sigset_t-fixes-musl-compil.patch

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
