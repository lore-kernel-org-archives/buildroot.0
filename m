From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 20:48:45 +0200
Subject: [Buildroot] [PATCH 1/1] sysvinit: bump to version 2.90
In-Reply-To: <20180913041800.7242-1-benj.calderon@gmail.com>
References: <20180913041800.7242-1-benj.calderon@gmail.com>
Message-ID: <20180913204845.0a8ec10b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Sep 2018 00:18:00 -0400, Benjamin Calderon wrote:
> This commit updates sysvinit package using the upstream tarball at
> http://download.savannah.nongnu.org/releases/sysvinit/ instead of the
> Debian tarball + patches currently in use
> 
> Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
> ---
>  package/sysvinit/0001-fix-libcrypt-test.patch | 20 ----------
>  .../0002-musl-fix-compilation-errors.patch    | 38 -------------------
>  package/sysvinit/sysvinit.hash                |  8 ++--
>  package/sysvinit/sysvinit.mk                  | 17 ++-------
>  4 files changed, 8 insertions(+), 75 deletions(-)
>  delete mode 100644 package/sysvinit/0001-fix-libcrypt-test.patch
>  delete mode 100644 package/sysvinit/0002-musl-fix-compilation-errors.patch

Applied to master, thanks! And thanks Carlos for taking the time to
test this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
