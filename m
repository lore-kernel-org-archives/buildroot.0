From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:06:18 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/trousers: bump version to
 0.3.14
In-Reply-To: <20180820054734.7709-1-bernd.kuhls@t-online.de>
References: <20180820054734.7709-1-bernd.kuhls@t-online.de>
Message-ID: <20180820230618.7b69ee64@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 07:47:34 +0200, Bernd Kuhls wrote:
> Removed patches 0001 & 0003, applied upstream.
> Rebased patches 0002 & 0004 and renumbered them.
> Added sha256 hashes for tarball and license file.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...r-understands-pie-and-relro-options.patch} | 17 ++--
>  ...-inline-for-read_data-and-write_data.patch | 94 -------------------
>  ...went_r-is-available-before-using-it.patch} |  8 +-
>  ...m-include-limits.h-to-fix-musl-build.patch | 29 ------
>  package/trousers/trousers.hash                |  9 +-
>  package/trousers/trousers.mk                  |  2 +-
>  6 files changed, 20 insertions(+), 139 deletions(-)
>  rename package/trousers/{0002-Check-if-the-compiler-understands-pie-and-relro-options.patch => 0001-Check-if-the-compiler-understands-pie-and-relro-options.patch} (97%)
>  delete mode 100644 package/trousers/0001-Remove-inline-for-read_data-and-write_data.patch
>  rename package/trousers/{0004-Check-that-getpwent_r-is-available-before-using-it.patch => 0002-Check-that-getpwent_r-is-available-before-using-it.patch} (93%)
>  delete mode 100644 package/trousers/0003-tsp_tcsi_param-include-limits.h-to-fix-musl-build.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
