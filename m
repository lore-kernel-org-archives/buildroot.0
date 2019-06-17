From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 21:03:28 +0200
Subject: [Buildroot] [PATCH v2 1/1] bananapro: bump Linux to 5.1.1
In-Reply-To: <20190617170127.7487-1-b.bilas@grinn-global.com>
References: <20190617170127.7487-1-b.bilas@grinn-global.com>
Message-ID: <20190617210328.622d4709@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Jun 2019 19:01:27 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
> Changes v1 -> v2:
>   - combine changes into one patch (suggested by Thomas)
> ---
>  ...s-sun7i-a20-bananapro.dts-disable-00.patch | 44 +++++++++++++++++++
>  .../brcmfmac43362-sdio.lemaker,bananapro.txt  |  1 +
>  configs/bananapro_defconfig                   |  7 +--
>  3 files changed, 49 insertions(+), 3 deletions(-)
>  create mode 100644 board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch
>  create mode 120000 board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.lemaker,bananapro.txt

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
