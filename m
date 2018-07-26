From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Jul 2018 19:03:16 +0300
Subject: [Buildroot] [PATCH v2 2/8] imx-vpu: rename package to
 imx-vpu-cnm
In-Reply-To: <20180726092631.4888-3-gary.bisson@boundarydevices.com>
References: <20180726092631.4888-1-gary.bisson@boundarydevices.com>
 <20180726092631.4888-3-gary.bisson@boundarydevices.com>
Message-ID: <87y3dyc7cr.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

Gary Bisson writes:
> +config BR2_PACKAGE_IMX_VPU_CNM
> +	bool "imx-vpu-cnm"
> +	depends on BR2_arm # Only relevant for i.MX
> +	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
> +	select BR2_PACKAGE_FIRMWARE_IMX
> +	help
> +	  Library of userspace helpers specific for the NXP i.MX SoC
> +	  integrating a Chips&Media CODA Video Processing Unit (VPU)
> +	  such as the i.MX5x/i.MX6x.

I believe this VPU is also in i.MX27 SoCs.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
