From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 22:13:32 +0200
Subject: [Buildroot] [PATCH] configs/acmesystems_aria_g25: new config
In-Reply-To: <1435595496-8627-1-git-send-email-gustavo@zacarias.com.ar>
References: <1435595496-8627-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150629221332.30296de3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 29 Jun 2015 13:31:36 -0300, Gustavo Zacarias wrote:

> diff --git a/board/acmesystems/aria-g25/at91bootstrap_aria_g25.config b/board/acmesystems/aria-g25/at91bootstrap_aria_g25.config
> new file mode 100644
> index 0000000..f4c12a7
> --- /dev/null
> +++ b/board/acmesystems/aria-g25/at91bootstrap_aria_g25.config
> @@ -0,0 +1,9 @@
> +CONFIG_AT91SAM9X5_ARIA=y
> +CONFIG_BUS_SPEED_100MHZ=y
> +CONFIG_RAM_128MB=y

So, 128 MB ?

> +CONFIG_SDCARD=y
> +CONFIG_LOAD_LINUX=y
> +CONFIG_LINUX_ZIMAGE=y
> +CONFIG_LINUX_KERNEL_ARG_STRING="mem=256M console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait"

Or 256 MB ?

Also, could you review the patch from Angelo adding support for another
board from ACME:

  http://patchwork.ozlabs.org/patch/485319/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
