From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 22:16:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
In-Reply-To: <20180623185544.10834-1-bernd.kuhls@t-online.de>
References: <20180623185544.10834-1-bernd.kuhls@t-online.de>
Message-ID: <20180625221654.225249cf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jun 2018 20:55:44 +0200, Bernd Kuhls wrote:
> Removed patch 0002, applied upstream:
> https://github.com/tvheadend/tvheadend/commit/068e5f921ddc22e648ebe006e515baf3e1ea12d1
> 
> Added patch to fix musl & uclibc build.
> 
> Renamed option dvbcsa to tvhcsa.
> 
> Upstream removed the dvbcsa configure option with this commit:
> https://github.com/tvheadend/tvheadend/commit/4e7f837c7055f4cb173164ca31af139e0a7858a5#diff-e2d5a00791bce9a01f99bc6fd613a39d
> 
> and moved the optional dvbcsa support inside the tvhcsa option block:
> https://github.com/tvheadend/tvheadend/blob/c76c7e0604977305498221f83c049d6d4fc715ed/configure#L645
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-configure-check-for-strlcat-strlcpy.patch | 97 +++++++++++++++++++
>  ...02-sbuf-fix-uclibc-compilation-error.patch | 33 -------
>  package/tvheadend/tvheadend.hash              |  2 +-
>  package/tvheadend/tvheadend.mk                |  6 +-
>  4 files changed, 101 insertions(+), 37 deletions(-)
>  create mode 100644 package/tvheadend/0002-configure-check-for-strlcat-strlcpy.patch
>  delete mode 100644 package/tvheadend/0002-sbuf-fix-uclibc-compilation-error.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
