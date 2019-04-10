From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 18:47:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.7.3
In-Reply-To: <20190410154243.112933-1-aduskett@gmail.com>
References: <20190410154243.112933-1-aduskett@gmail.com>
Message-ID: <20190410184756.606d4c55@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Apr 2019 11:42:43 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Aslo remove upstream patch 0033.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  ...e-the-build-of-pyc-files-conditional.patch |   4 +-
>  ...taddrinfo-configure-test-when-cross-.patch |   2 +-
>  ...re-to-disable-the-build-of-certain-e.patch |  10 +-
>  ...y-header-paths-for-cross-compilation.patch |   2 +-
>  ...ook-in-usr-lib-termcap-for-libraries.patch |   2 +-
>  .../0006-Don-t-add-multiarch-paths.patch      |   2 +-
>  .../0007-Abort-on-failed-module-build.patch   |   2 +-
>  ...locale-and-set-to-default-when-addin.patch |   2 +-
>  ...-disable-installation-of-test-module.patch |   6 +-
>  .../0014-Add-an-option-to-disable-pydoc.patch |  12 +-
>  ...015-Add-an-option-to-disable-lib2to3.patch |  14 +-
>  ...option-to-disable-the-sqlite3-module.patch |   8 +-
>  ...d-an-option-to-disable-the-tk-module.patch |   8 +-
>  ...-option-to-disable-the-curses-module.patch |   6 +-
>  .../0019-Add-an-option-to-disable-expat.patch |   8 +-
>  ...-Add-an-option-to-disable-CJK-codecs.patch |   2 +-
>  .../0021-Add-an-option-to-disable-NIS.patch   |   2 +-
>  ...Add-an-option-to-disable-unicodedata.patch |   2 +-
>  .../0023-Add-an-option-to-disable-IDLE.patch  |  10 +-
>  ...024-Add-an-option-to-disable-decimal.patch |   4 +-
>  ...on-to-disable-the-ossaudiodev-module.patch |   2 +-
>  ...an-option-to-disable-openssl-support.patch |   2 +-
>  ...ption-to-disable-the-readline-module.patch |   2 +-
>  ...to-disable-zlib-bzip2-and-xz-modules.patch |   2 +-
>  ...-Fix-cross-compiling-the-uuid-module.patch |   2 +-
>  ...Add-an-option-to-disable-uuid-module.patch |   2 +-
>  ...gfault-in-ssl-s-cert-parser-GH-11569.patch | 121 ------------------
>  package/python3/python3.hash                  |   6 +-
>  package/python3/python3.mk                    |   2 +-
>  29 files changed, 64 insertions(+), 185 deletions(-)
>  delete mode 100644 package/python3/0033-bpo-35746-Fix-segfault-in-ssl-s-cert-parser-GH-11569.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
