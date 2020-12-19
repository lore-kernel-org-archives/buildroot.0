From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 19 Dec 2020 20:08:28 +0200
Subject: [Buildroot] [PATCH v3 11/11]
 configs/solidrun_macchiatobin_efi_defconfig: EFI config for MacchiatoBin
In-Reply-To: <20201218202646.1060123-12-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-12-hi@senzilla.io>
Message-ID: <87bleppt2b.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dick,

On Fri, Dec 18 2020, Dick Olsson via buildroot wrote:
> This introduces an alternative board build for the MacchiatoBin based on
> EDK2 (UEFI) firmware loaded as BL33 by ARM Trusted Firmware.
>
> Signed-off-by: Dick Olsson <hi@senzilla.io>
> ---

[...]

> diff --git a/board/solidrun/macchiatobin-efi/readme.txt b/board/solidrun/macchiatobin-efi/readme.txt
> new file mode 100644
> index 0000000000..42205f3d4e
> --- /dev/null
> +++ b/board/solidrun/macchiatobin-efi/readme.txt
> @@ -0,0 +1,14 @@
> +Intro
> +=====
> +
> +This is the board support for MacchiatoBin with UEFI. Refer to
> +board/solidrun/macchiatobin/readme.txt for more information.

Please add a "How to build" section here. The details on the "generic"
readme.txt "How to build" section are not correct for this defconfig.

baruch

> +
> +More info
> +=========
> +
> +For more information about the UEFI support for this board see:
> +
> +- https://developer.solid-run.com/knowledge-base/armada-8040-uefi/
> +- http://wiki.macchiatobin.net/tiki-index.php?page=Build+from+source+-+UEFI+EDK+II
> +- http://wiki.macchiatobin.net/tiki-index.php?page=Update+the+Bootloader

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
