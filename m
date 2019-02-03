From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Sun, 03 Feb 2019 21:44:19 +0100
Subject: [Buildroot] [PATCH] configs/rock64: new defconfig
In-Reply-To: <20190203204119.31934-1-michal.lyszczek@bofc.pl>
References: <20190203204119.31934-1-michal.lyszczek@bofc.pl>
Message-ID: <20190203204419.fy4qpno34w3ahvol@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-02-03 21:41:19, Micha? ?yszczek wrote:
> Configuration contains:
>   - building tpl, spl and u-boot (forked u-boot repository)
>   - booting from SD card and network via PXE
>   - working ethernet, usb and uart
>   - minimal rootfs with busybox
>   - ready to flash SD card image
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> ---

Please, note that this patch requires another patch that is not yet merged:

[v3] uboot: add support for bundling ATF BL31 in ELF format into U-Boot
http://patchwork.ozlabs.org/patch/996196/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190203/605dd84c/attachment.asc>
