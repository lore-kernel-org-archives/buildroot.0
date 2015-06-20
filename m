From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sat, 20 Jun 2015 09:29:49 +0200
Subject: [Buildroot] [V2 4/4] A20-OLinuXino-Lime: new board (mali)
In-Reply-To: <CAB0FRsvzKgP23+-fuwawaqyrJfzY39BLns+jkd1rBwgfdCoMsQ@mail.gmail.com>
References: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
 <1434741204-3988-5-git-send-email-francois.perrad@gadz.org>
 <20150619200859.GH11732@lukather>
 <CAB0FRsvzKgP23+-fuwawaqyrJfzY39BLns+jkd1rBwgfdCoMsQ@mail.gmail.com>
Message-ID: <20150620072949.GI11732@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 20, 2015 at 07:28:01AM +0200, Fran?ois Perrad wrote:
> >> +# Bootloaders
> >> +BR2_TARGET_UBOOT=y
> >> +BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime"
> >> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> >> +BR2_TARGET_UBOOT_VERSION="sunxi"
> >> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
> >> +# based on U-Boot 2014.04
> >> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ea1ac32bf76eb60baef474c2516fc431b381d952"
> >> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> >> +BR2_TARGET_UBOOT_SPL=y
> >> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> >
> > U-boot sunxi is unmaintained and deprecated, you probably don't wnat
> > to use that.
> >
> 
> When I try to use the mainline U-Boot (which works well with a
> mainline kernel), I cannot start the linux-sunxi kernel.
> I think that it is problem with bootargs, but I haven't found the good
> 'magic' value.
> So, I stay with U-boot sunxi.

I'm not sure this is a valid argument for such a patch. Have you read
https://linux-sunxi.org/Mainline_U-boot#Boot ?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150620/39cab939/attachment.asc>
