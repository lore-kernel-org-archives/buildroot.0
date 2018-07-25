From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 22:58:23 +0200
Subject: [Buildroot] [PATCH 1/1] i2pd: bump to version 2.19.0
In-Reply-To: <20180723154517.29261-1-fontaine.fabrice@gmail.com>
References: <20180723154517.29261-1-fontaine.fabrice@gmail.com>
Message-ID: <20180725225823.31633a42@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Jul 2018 17:45:17 +0200, Fabrice Fontaine wrote:
> - Remove first two patches (already in version)
> - Rename third patch so it is now the first one
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch | 28 ---------
>  ...ists.txt-don-t-install-source-and-licens.patch} |  0
>  package/i2pd/0002-Install-libi2pdclient.patch      | 69 ----------------------
>  package/i2pd/i2pd.hash                             |  2 +-
>  package/i2pd/i2pd.mk                               |  2 +-
>  5 files changed, 2 insertions(+), 99 deletions(-)
>  delete mode 100644 package/i2pd/0001-Fix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch
>  rename package/i2pd/{0003-build-CMakeLists.txt-don-t-install-source-and-licens.patch => 0001-build-CMakeLists.txt-don-t-install-source-and-licens.patch} (100%)
>  delete mode 100644 package/i2pd/0002-Install-libi2pdclient.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
