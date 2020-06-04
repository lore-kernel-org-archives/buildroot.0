From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:19:53 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/ell: bump version to 0.31
In-Reply-To: <20200602221745.3209-1-ps.report@gmx.net>
References: <20200602221745.3209-1-ps.report@gmx.net>
Message-ID: <20200604231953.2913bd26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Jun 2020 00:17:44 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - removed 0001-ell-ecc.h-fix-build-with-uclibc.patch
>   (upstream applied [1])
> 
> - update 0002-ell-rtnl-fix-compile-with-older-toolchains.patch
>  (add upstream link)
> 
> [1] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=aa30f1884cf72d590fdca1db11d4fb2c2d526141
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - add missing sob line
> ---
>  ...0001-ell-ecc.h-fix-build-with-uclibc.patch | 31 -------------------
>  ...nl-fix-compile-with-older-toolchains.patch |  1 +
>  package/ell/ell.hash                          |  2 +-
>  package/ell/ell.mk                            |  2 +-
>  4 files changed, 3 insertions(+), 33 deletions(-)
>  delete mode 100644 package/ell/0001-ell-ecc.h-fix-build-with-uclibc.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
