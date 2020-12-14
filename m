From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 14 Dec 2020 23:24:19 +0100
Subject: [Buildroot] [PATCH v4 0/8] Add imx8mm platform using only
 upstream components
In-Reply-To: <20201125183017.15585-1-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
 <20201125183017.15585-1-xroumegue@gmail.com>
Message-ID: <CAEyMn7ZdJrqh+uPU9N4s6vUoTQpA3Huy2R_MiWqf06vPKW0WaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xavier,

Am Mi., 25. Nov. 2020 um 19:30 Uhr schrieb Xavier Roumegue
<xroumegue@gmail.com>:
>
> This patch set aims to add support for booting imx8m platforms with upstream
> BSP components, avoiding the use of proprietary imx-mkimage tool.
>
> Uboot is using its embedded mkimage tool and a per platform configuration file
> to generate the boot medium thanks to additional imx specific makefile targets.
>
> Delegating the bootable image generation to uboot requires proprietary SoC
> firmwares either involved in the boot flow or eventually requiring
> authentication to be copied in the uboot build directory.
>
> As per Thomas proposal, this patch set mainly adds an option to copy a files
> list, from binaries folder to uboot build directory as dependency of uboot
> build step.
>
> This was inspired from SolidRun patch below:
> https://github.com/SolidRun/buildroot/commit/0f2b2971e836b508bf9c2dac34426a59a9d83572
> but this was adapted to prevent uboot patches and generalize the approach to
> any platforms.

I gave the whole series a try. I was successfully able to create the
U-Boot flash.bin for an imx8mq SOC.

So it works for me. Thank you.

-- 
Heiko
