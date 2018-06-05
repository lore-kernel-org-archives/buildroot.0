From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:48:26 +0200
Subject: [Buildroot] [PATCH] board: orangepi: zero-plus2: bump linux to
 v4.16
In-Reply-To: <20180605093632.26724-1-jagan@amarulasolutions.com>
References: <20180605093632.26724-1-jagan@amarulasolutions.com>
Message-ID: <20180605184826.280555d1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 15:06:32 +0530, Jagan Teki wrote:
> Bump linux as well headers to v4.16 version, this
> eventually drop the wifi patch since it has been
> merged to Linux v4.16.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  ...64-dts-orange-pi-zero-plus2-enable-ap6212.patch | 73 ----------------------
>  configs/orangepi_zero_plus2_defconfig              |  5 +-
>  2 files changed, 2 insertions(+), 76 deletions(-)
>  delete mode 100644 board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-enable-ap6212.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
