From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Jul 2021 11:09:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.9.6
In-Reply-To: <20210703210608.108834-1-aduskett@gmail.com>
References: <20210703210608.108834-1-aduskett@gmail.com>
Message-ID: <20210704110944.2dfd2a93@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Jul 2021 14:06:08 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Other changes:
>   - Rename 0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch to
>     0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch, as to not
>     overlap with 0034-Add-an-option-to-disable-the-berkeleydb-module.patch
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...1-Make-the-build-of-pyc-files-conditional.patch |  6 +++---
>  ...gy_getaddrinfo-configure-test-when-cross-.patch |  2 +-
>  ...ructure-to-disable-the-build-of-certain-e.patch | 10 +++++-----
>  ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  2 +-
>  .../python3/0006-Don-t-add-multiarch-paths.patch   |  2 +-
>  .../0007-Abort-on-failed-module-build.patch        |  2 +-
>  ...stem-locale-and-set-to-default-when-addin.patch |  2 +-
>  ...0012-Add-importlib-fix-for-PEP-3147-issue.patch |  6 +++---
>  ...on-to-disable-installation-of-test-module.patch |  6 +++---
>  .../0014-Add-an-option-to-disable-pydoc.patch      | 12 ++++++------
>  .../0015-Add-an-option-to-disable-lib2to3.patch    | 14 +++++++-------
>  ...-Add-option-to-disable-the-sqlite3-module.patch |  8 ++++----
>  ...17-Add-an-option-to-disable-the-tk-module.patch |  8 ++++----
>  ...dd-an-option-to-disable-the-curses-module.patch |  6 +++---
>  .../0019-Add-an-option-to-disable-expat.patch      |  8 ++++----
>  .../0020-Add-an-option-to-disable-CJK-codecs.patch |  2 +-
>  .../0021-Add-an-option-to-disable-NIS.patch        |  2 +-
>  ...0022-Add-an-option-to-disable-unicodedata.patch |  2 +-
>  .../0023-Add-an-option-to-disable-IDLE.patch       | 10 +++++-----
>  .../0024-Add-an-option-to-disable-decimal.patch    |  4 ++--
>  ...-option-to-disable-the-ossaudiodev-module.patch |  2 +-
>  ...-Add-an-option-to-disable-openssl-support.patch |  2 +-
>  ...-an-option-to-disable-the-readline-module.patch |  2 +-
>  ...ions-to-disable-zlib-bzip2-and-xz-modules.patch |  2 +-
>  .../0030-Fix-cross-compiling-the-uuid-module.patch |  2 +-
>  ...0031-Add-an-option-to-disable-uuid-module.patch |  2 +-
>  ...c-fixup-CC-print-multiarch-output-for-mus.patch |  2 +-
>  ...n-option-to-disable-the-berkeleydb-module.patch |  2 +-
>  ...libc-ng-doesn-t-set-errno-when-encryptio.patch} |  0
>  package/python3/python3.hash                       |  6 +++---
>  package/python3/python3.mk                         |  2 +-
>  31 files changed, 69 insertions(+), 69 deletions(-)
>  rename package/python3/{0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
