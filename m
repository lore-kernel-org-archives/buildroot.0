From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 21:13:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: rebase patches with
 incorrect offsets for python 3.9.0
In-Reply-To: <20201014185417.2420633-1-james.hilliard1@gmail.com>
References: <20201014185417.2420633-1-james.hilliard1@gmail.com>
Message-ID: <20201014211304.3e5d8441@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Oct 2020 12:54:17 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This rebases the remaining patches for python 3.9.0 not included in
> f26ce577605e843ebf0f5583242ee9ff3cd08ac3.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...e-the-build-of-pyc-files-conditional.patch | 14 +++++------
>  ...taddrinfo-configure-test-when-cross-.patch |  8 +++----
>  ...re-to-disable-the-build-of-certain-e.patch | 20 ++++++++--------
>  ...y-header-paths-for-cross-compilation.patch | 12 +++++-----
>  ...ook-in-usr-lib-termcap-for-libraries.patch |  8 +++----
>  .../0006-Don-t-add-multiarch-paths.patch      |  8 +++----
>  .../0007-Abort-on-failed-module-build.patch   |  8 +++----
>  .../0008-Serial-ioctl-workaround.patch        |  6 ++---
>  ...e-shebang-of-Python-scripts-for-cros.patch |  4 ++--
>  ...ig.sh.in-ensure-sed-invocations-only.patch |  4 ++--
>  ...Add-importlib-fix-for-PEP-3147-issue.patch | 12 +++++-----
>  ...015-Add-an-option-to-disable-lib2to3.patch | 24 +++++++++----------
>  ...option-to-disable-the-sqlite3-module.patch | 16 ++++++-------
>  ...d-an-option-to-disable-the-tk-module.patch | 20 ++++++++--------
>  ...-Add-an-option-to-disable-CJK-codecs.patch |  8 +++----
>  .../0021-Add-an-option-to-disable-NIS.patch   |  8 +++----
>  ...Add-an-option-to-disable-unicodedata.patch |  8 +++----
>  .../0023-Add-an-option-to-disable-IDLE.patch  | 20 ++++++++--------
>  ...on-to-disable-the-ossaudiodev-module.patch |  8 +++----
>  ...an-option-to-disable-openssl-support.patch |  8 +++----
>  ...ption-to-disable-the-readline-module.patch |  8 +++----
>  ...to-disable-zlib-bzip2-and-xz-modules.patch |  8 +++----
>  ...thon-config.sh-don-t-reassign-prefix.patch |  4 ++--
>  ...-Fix-cross-compiling-the-uuid-module.patch |  8 +++----
>  ...Add-an-option-to-disable-uuid-module.patch |  8 +++----
>  ...-fix-building-on-older-distributions.patch |  4 ++--
>  ...up-CC-print-multiarch-output-for-mus.patch |  8 +++----
>  27 files changed, 136 insertions(+), 136 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
