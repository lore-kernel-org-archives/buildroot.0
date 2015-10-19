From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 19 Oct 2015 08:17:36 +0300
Subject: [Buildroot] [PATCH 1/1] board/via/imx6_vab820: update to latest
 BSP release
In-Reply-To: <1445226305-29641-1-git-send-email-imrehg@gmail.com>
References: <1445226305-29641-1-git-send-email-imrehg@gmail.com>
Message-ID: <20151019051736.GN20889@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Imreh,

On Mon, Oct 19, 2015 at 11:45:05AM +0800, imrehg at gmail.com wrote:
> +# Minimal SD card image for the VIA VAB-820 / AMOS-820
> +#
> +# The SD card must have at least 1 MB free at the beginning.
> +# U-Boot and is dumped as is.

Something went wrong in this statement.

> +# A FAT boot partition and an Ext4 root filesystem partition are required.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
