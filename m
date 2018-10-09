From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 09:19:05 +0200
Subject: [Buildroot] [PATCH v1 1/3] qt5connectivity: add license files
 hashes
In-Reply-To: <20181002211637.2356-1-ps.report@gmx.net>
References: <20181002211637.2356-1-ps.report@gmx.net>
Message-ID: <20181009091905.1251cc90@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Oct 2018 23:16:35 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5connectivity/qt5connectivity.hash | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
> index 96f22db60a..e789ce0b4f 100644
> --- a/package/qt5/qt5connectivity/qt5connectivity.hash
> +++ b/package/qt5/qt5connectivity/qt5connectivity.hash
> @@ -3,3 +3,14 @@ sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnec
>  
>  # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtconnectivity-everywhere-src-5.11.2.tar.xz.mirrorlist
>  sha256 58901bbd14d3bc472f27fe305fd8dc33cffbd10da83616e9691c04c3290d42c5 qtconnectivity-everywhere-src-5.11.2.tar.xz
> +
> +# Hashes for license files:
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
> +sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
> +sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
> +sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
> +sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
> +sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
> +sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
> +sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3

Actually, I think per-version hash files are better, and that's the
direction we are taking, so I've split this into two hash files, one
per version. Of course for the tarballs, I kept the common hash file
for now, as this is the only thing we support.

Also, the hash for LGPL_EXCEPTION.txt was missing for the 5.6.3
version, so I've added that.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
