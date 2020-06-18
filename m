From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:16:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.8.3
In-Reply-To: <20200614202346.133133-1-aduskett@gmail.com>
References: <20200614202346.133133-1-aduskett@gmail.com>
Message-ID: <20200618221632.45e8c48b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jun 2020 13:23:46 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  .../0001-Make-the-build-of-pyc-files-conditional.patch      | 2 +-
>  ...sable-buggy_getaddrinfo-configure-test-when-cross-.patch | 2 +-
>  ...d-infrastructure-to-disable-the-build-of-certain-e.patch | 2 +-
>  ...d-an-option-to-disable-installation-of-test-module.patch | 2 +-
>  package/python3/0014-Add-an-option-to-disable-pydoc.patch   | 2 +-
>  package/python3/0015-Add-an-option-to-disable-lib2to3.patch | 2 +-
>  .../0016-Add-option-to-disable-the-sqlite3-module.patch     | 2 +-
>  .../0017-Add-an-option-to-disable-the-tk-module.patch       | 2 +-
>  .../0018-Add-an-option-to-disable-the-curses-module.patch   | 2 +-
>  package/python3/0019-Add-an-option-to-disable-expat.patch   | 2 +-
>  .../python3/0020-Add-an-option-to-disable-CJK-codecs.patch  | 2 +-
>  package/python3/0021-Add-an-option-to-disable-NIS.patch     | 2 +-
>  .../python3/0022-Add-an-option-to-disable-unicodedata.patch | 2 +-
>  package/python3/0023-Add-an-option-to-disable-IDLE.patch    | 2 +-
>  package/python3/0024-Add-an-option-to-disable-decimal.patch | 6 +++---
>  ...25-Add-an-option-to-disable-the-ossaudiodev-module.patch | 6 +++---
>  .../0026-Add-an-option-to-disable-openssl-support.patch     | 2 +-
>  .../0027-Add-an-option-to-disable-the-readline-module.patch | 2 +-
>  ...8-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch | 2 +-
>  .../python3/0031-Add-an-option-to-disable-uuid-module.patch | 2 +-
>  ...nfigure.ac-fixup-CC-print-multiarch-output-for-mus.patch | 2 +-
>  package/python3/python3.hash                                | 6 +++---
>  package/python3/python3.mk                                  | 2 +-
>  23 files changed, 29 insertions(+), 29 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
