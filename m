From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 5 Feb 2016 21:27:06 +0100
Subject: [Buildroot] [PATCH] board/atmel/xplained/readme.txt: fix u-boot
 filename
In-Reply-To: <1454516043-4143-1-git-send-email-luca@lucaceresoli.net>
References: <1454516043-4143-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <56B5059A.7050204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-02-16 17:14, Luca Ceresoli wrote:
> The file that is actually produced is called u-boot-spl.bin, not
> uboot-spl.bin.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(verified that it's indeed u-boot-spl.bin)

 Regards,
 Arnout

> ---
>  board/atmel/xplained/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/atmel/xplained/readme.txt b/board/atmel/xplained/readme.txt
> index 1d19327..ba45122 100644
> --- a/board/atmel/xplained/readme.txt
> +++ b/board/atmel/xplained/readme.txt
> @@ -52,7 +52,7 @@ sudo mount /dev/mmcblk0p2 /media/rootfs
>  Copy the bootloaders, kernel image and Device Tree blob to the first
>  partition:
>  
> -cp output/images/uboot-spl.bin /media/boot/boot.bin
> +cp output/images/u-boot-spl.bin /media/boot/boot.bin
>  cp output/images/u-boot.img /media/boot/u-boot.img
>  cp output/images/zImage /media/boot/zImage
>  cp output/images/at91-sama5d3_xplained.dtb /media/boot/at91-sama5d3_xplained.dtb
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
