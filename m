From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jan 2019 15:03:54 +0100
Subject: [Buildroot] [PATCH] configs/qemu_riscv64_virt_defconfig: bump
 Linux version
In-Reply-To: <20190121200450.4023-1-gwenj@trabucayre.com>
References: <20190121200450.4023-1-gwenj@trabucayre.com>
Message-ID: <20190126150354.4fb33b8c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Jan 2019 21:04:50 +0100, Gwenhael Goavec-Merou wrote:

> -# Linux headers same as kernel, a 4.15 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
> +# Linux headers same as kernel, a 4.20 series
> +BR2_KERNEL_HEADERS_4_20=y

Why isn't this

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y

 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
