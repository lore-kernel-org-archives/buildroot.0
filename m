From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Feb 2019 09:42:15 +0100
Subject: [Buildroot] [PATCH v3] configs/rock64: new defconfig
In-Reply-To: <20190206162034.22403-1-michal.lyszczek@bofc.pl>
References: <20190206162034.22403-1-michal.lyszczek@bofc.pl>
Message-ID: <20190207094215.6481f37e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Feb 2019 17:20:34 +0100
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> Configuration contains:
>   - building tpl, spl and u-boot (forked u-boot repository)
>   - booting from SD card and network via PXE
>   - working ethernet, usb and uart
>   - minimal rootfs with busybox
>   - ready to flash SD card image
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> 
> ---
> Changes v2 -> v3:
>   - sync with new ATF versioning

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
