From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 21:56:32 +0200
Subject: [Buildroot] [PATCH] swupdate: bump to version 2018.03
In-Reply-To: <20180413063437.32284-1-joerg.krause@embedded.rocks>
References: <20180413063437.32284-1-joerg.krause@embedded.rocks>
Message-ID: <20180415215632.41858899@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Apr 2018 08:34:37 +0200, J?rg Krause wrote:
> Remove upstream patches:
>   * 0001-compat.h-introduce-compatibility-header.patch
>   * 0002-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch
> 
> Update note about bundled modified version of mongoose 6.11.
> 
> Update licenses. Some files are LGPL-2.1+ now. Remove Public Domain as the
> relevant bundled sqlite3 code was removed some time age.
> 
> Regenerated the .config file by doing:
> 
> ```
> make swupdate-menuconfig
> make swupdate-update-config
> ```
> .. and removing the paths for the build options manually.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...pat.h-introduce-compatibility-header.patch |  87 --------------
>  ...build-if-DOWNLOAD-is-set-but-no-JSON.patch | 107 ------------------
>  package/swupdate/swupdate.config              |  25 ++--
>  package/swupdate/swupdate.hash                |   2 +-
>  package/swupdate/swupdate.mk                  |   6 +-
>  5 files changed, 13 insertions(+), 214 deletions(-)
>  delete mode 100644 package/swupdate/0001-compat.h-introduce-compatibility-header.patch
>  delete mode 100644 package/swupdate/0002-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
