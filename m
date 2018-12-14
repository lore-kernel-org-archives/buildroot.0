From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 22:00:10 +0100
Subject: [Buildroot] [PATCH v1 1/2] ell: bump version to 0.16
In-Reply-To: <20181213225521.26400-1-ps.report@gmx.net>
References: <20181213225521.26400-1-ps.report@gmx.net>
Message-ID: <20181214220010.174414cd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Dec 2018 23:55:20 +0100, Peter Seiderer wrote:
> - drop 0001-ell-ell.sym-add-missing-l_genl_family_set_unicast_ha.patch
>   (upstream applied [1])
> 
> [1] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=01254efa6f69078000da7e87e43c9f245df0cfc0
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...missing-l_genl_family_set_unicast_ha.patch | 30 -------------------
>  package/ell/ell.hash                          |  2 +-
>  package/ell/ell.mk                            |  2 +-
>  3 files changed, 2 insertions(+), 32 deletions(-)
>  delete mode 100644 package/ell/0001-ell-ell.sym-add-missing-l_genl_family_set_unicast_ha.patch

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
