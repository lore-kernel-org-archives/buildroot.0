From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 22:51:46 +0100
Subject: [Buildroot] [PATCH v2 01/15] boot: Add new bootloader
 afboot-stm32
In-Reply-To: <1456167569-8713-2-git-send-email-lee.jones@linaro.org>
References: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
 <1456167569-8713-2-git-send-email-lee.jones@linaro.org>
Message-ID: <20160222225146.6cc8fd3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lee Jones,

On Mon, 22 Feb 2016 18:59:15 +0000, Lee Jones wrote:

> diff --git a/boot/afboot-stm32/Config.in b/boot/afboot-stm32/Config.in
> new file mode 100644
> index 0000000..2570b08
> --- /dev/null
> +++ b/boot/afboot-stm32/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_TARGET_AFBOOT_STM32
> +	bool "afboot-stm32"

In the previous review, forgot to mention that you should add a:

	depends on BR2_arm

here.

Other than that:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
