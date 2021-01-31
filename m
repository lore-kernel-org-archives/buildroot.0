From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:30:00 +0100
Subject: [Buildroot] [PATCH] package/sunxi-mali-mainline-driver: bump
 version
In-Reply-To: <20210131175812.1567783-1-giulio.benetti@benettiengineering.com>
References: <20210131175812.1567783-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210131213000.21632cae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Jan 2021 18:58:12 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Bump version and drop local patches already merged upstream. Add Linux
> option needed by Linux version >= 4.20 package documentation and to .mk
> file that automatically adds it to Linux config when building.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...01-mali-support-building-against-5.9.patch | 269 ------------------
>  ...2-mali-support-building-against-5.10.patch |  98 -------
>  package/sunxi-mali-mainline-driver/Config.in  |   4 +
>  .../sunxi-mali-mainline-driver.hash           |   2 +-
>  .../sunxi-mali-mainline-driver.mk             |   3 +-
>  5 files changed, 7 insertions(+), 369 deletions(-)
>  delete mode 100644 package/sunxi-mali-mainline-driver/0001-mali-support-building-against-5.9.patch
>  delete mode 100644 package/sunxi-mali-mainline-driver/0002-mali-support-building-against-5.10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
