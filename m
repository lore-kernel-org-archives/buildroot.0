From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Oct 2019 09:52:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: bump to version 3.8.0
In-Reply-To: <20191016223834.59653-1-james.hilliard1@gmail.com>
References: <20191016223834.59653-1-james.hilliard1@gmail.com>
Message-ID: <20191017095213.79860610@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Oct 2019 16:38:34 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Rebased patches on 3.8.0
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...e-the-build-of-pyc-files-conditional.patch | 18 +++----
>  ...taddrinfo-configure-test-when-cross-.patch |  8 +--
>  ...re-to-disable-the-build-of-certain-e.patch | 37 +++++++-------
>  ...y-header-paths-for-cross-compilation.patch | 12 ++---
>  ...ook-in-usr-lib-termcap-for-libraries.patch | 20 ++++----
>  .../0006-Don-t-add-multiarch-paths.patch      | 18 +++----
>  .../0007-Abort-on-failed-module-build.patch   |  8 +--
>  .../0008-Serial-ioctl-workaround.patch        |  8 +--
>  ...e-shebang-of-Python-scripts-for-cros.patch |  4 +-
>  ...ig.sh.in-ensure-sed-invocations-only.patch |  8 +--
>  ...locale-and-set-to-default-when-addin.patch | 16 +++---
>  ...Add-importlib-fix-for-PEP-3147-issue.patch | 50 +++++++++++--------
>  ...-disable-installation-of-test-module.patch | 26 ++++------
>  .../0014-Add-an-option-to-disable-pydoc.patch | 26 +++++-----
>  ...015-Add-an-option-to-disable-lib2to3.patch | 34 ++++++-------
>  ...option-to-disable-the-sqlite3-module.patch | 16 +++---
>  ...d-an-option-to-disable-the-tk-module.patch | 18 +++----
>  ...-option-to-disable-the-curses-module.patch | 14 +++---
>  .../0019-Add-an-option-to-disable-expat.patch | 18 +++----
>  ...-Add-an-option-to-disable-CJK-codecs.patch |  8 +--
>  .../0021-Add-an-option-to-disable-NIS.patch   |  8 +--
>  ...Add-an-option-to-disable-unicodedata.patch |  8 +--
>  .../0023-Add-an-option-to-disable-IDLE.patch  | 24 ++++-----
>  ...024-Add-an-option-to-disable-decimal.patch | 14 +++---
>  ...on-to-disable-the-ossaudiodev-module.patch |  8 +--
>  ...an-option-to-disable-openssl-support.patch |  8 +--
>  ...ption-to-disable-the-readline-module.patch |  8 +--
>  ...to-disable-zlib-bzip2-and-xz-modules.patch |  8 +--
>  ...thon-config.sh-don-t-reassign-prefix.patch |  8 +--
>  ...-Fix-cross-compiling-the-uuid-module.patch | 18 +++----
>  ...Add-an-option-to-disable-uuid-module.patch |  8 +--
>  ...-fix-building-on-older-distributions.patch |  4 +-
>  ...up-CC-print-multiarch-output-for-mus.patch |  8 +--
>  package/python3/python3.hash                  |  6 +--
>  package/python3/python3.mk                    |  4 +-
>  35 files changed, 255 insertions(+), 254 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
