From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 09:16:29 +0200
Subject: [Buildroot] [PATCH 1/1] configs/bananapro: bump Linux to 5.3.4
In-Reply-To: <20191006132808.12060-1-b.bilas@grinn-global.com>
References: <20191006132808.12060-1-b.bilas@grinn-global.com>
Message-ID: <20191008091629.2a37673a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 15:28:08 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Removed no longer necessary patch.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  ...s-sun7i-a20-bananapro.dts-disable-00.patch | 44 -------------------
>  configs/bananapro_defconfig                   |  7 ++-
>  2 files changed, 3 insertions(+), 48 deletions(-)
>  delete mode 100644 board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
