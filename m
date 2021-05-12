From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 12 May 2021 21:48:20 +0300
Subject: [Buildroot] [PATCH v5 08/10]
 configs/solidrun_macchiatobin_efi_defconfig: EFI config for MacchiatoBin
In-Reply-To: <YK98cdG9XvJlBwgNgb6z06q0X0AviluWVY7cQ4nJH7c@cp4-web-027.plabs.ch>
References: <YK98cdG9XvJlBwgNgb6z06q0X0AviluWVY7cQ4nJH7c@cp4-web-027.plabs.ch>
Message-ID: <875yznwzyj.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dick,

On Wed, May 12 2021, Dick Olsson via buildroot wrote:
> This introduces an alternative board build for the MacchiatoBin based on
> EDK2 (UEFI) firmware loaded as BL33 by ARM Trusted Firmware.
>
> Signed-off-by: Dick Olsson <hi@senzilla.io>
>
> ---

...

> +Second, attach to the serial console[1], ...
> +
> +[1]: http://wiki.espressobin.net/tiki-index.php?page=Quick+User+Guide

That is not the right URL. Use this instead:

  http://wiki.macchiatobin.net/tiki-index.php?page=Quick+Start+Guide

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
