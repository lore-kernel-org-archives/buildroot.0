From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 22:09:16 +0100
Subject: [Buildroot] [PATCH] i2c-tools: bump to version 4.1
In-Reply-To: <4bd477748470d4560a70b6d2e297eb747ef2f4c3.1544529126.git.baruch@tkos.co.il>
References: <4bd477748470d4560a70b6d2e297eb747ef2f4c3.1544529126.git.baruch@tkos.co.il>
Message-ID: <20181213220916.7ce67607@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Dec 2018 13:52:06 +0200, Baruch Siach wrote:
> Drop upstream patches.
> 
> Rename 'prefix' to 'PREFIX' following upstream change.
> 
> Update README hash for build documentation changes unrelated to license.
> 
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...b-Module.mk-Add-missing-dependencies.patch | 34 ----------
>  ...-Add-flag-to-disable-dynamic-library.patch | 64 ------------------
>  ....mk-Drop-unused-variable-LIB_OBJECTS.patch | 33 ---------
>  ...s-Module.mk-Add-missing-dependencies.patch | 67 -------------------
>  ...b-Module.mk-Fix-LIB_LINKS-dependency.patch | 34 ----------
>  ...o-really-disable-the-dynamic-library.patch | 33 ---------
>  ...rog-Module.mk-Add-missing-dependency.patch | 30 ---------
>  ...n-t-install-dynamic-library-when-dis.patch | 41 ------------
>  package/i2c-tools/i2c-tools.hash              |  4 +-
>  package/i2c-tools/i2c-tools.mk                |  6 +-
>  10 files changed, 5 insertions(+), 341 deletions(-)
>  delete mode 100644 package/i2c-tools/0001-lib-Module.mk-Add-missing-dependencies.patch
>  delete mode 100644 package/i2c-tools/0002-Makefile-Add-flag-to-disable-dynamic-library.patch
>  delete mode 100644 package/i2c-tools/0003-lib-Module.mk-Drop-unused-variable-LIB_OBJECTS.patch
>  delete mode 100644 package/i2c-tools/0004-tools-Module.mk-Add-missing-dependencies.patch
>  delete mode 100644 package/i2c-tools/0005-lib-Module.mk-Fix-LIB_LINKS-dependency.patch
>  delete mode 100644 package/i2c-tools/0006-Makefile-Allow-to-really-disable-the-dynamic-library.patch
>  delete mode 100644 package/i2c-tools/0007-eeprog-Module.mk-Add-missing-dependency.patch
>  delete mode 100644 package/i2c-tools/0008-lib-Module.mk-don-t-install-dynamic-library-when-dis.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
