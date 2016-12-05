From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 23:18:43 +0100
Subject: [Buildroot] [PATCH 0/8] arch/arm: allow selecting AArch64 cores
In-Reply-To: <cover.1480540299.git.yann.morin.1998@free.fr>
References: <cover.1480540299.git.yann.morin.1998@free.fr>
Message-ID: <20161205231843.45b80465@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Nov 2016 22:12:06 +0100, Yann E. MORIN wrote:

> Matt Flax (1):
>       arch/Config.in.arm: Add Cortex-A53 CPU
> 
> Thomas Petazzoni (6):
>       arch: merge Config.in.aarch64 into Config.in.arm
>       arch/Config.in.arm: prepare addition of 64 bits cores
>       arch/Config.in.arm: add BR2_ARM_CPU_ARMV8
>       arch/Config.in.arm: add FPU related options for ARMv8 cores
>       arch/Config.in.arm: specify ABI for ARM64
>       arch/Config.in.arm: add Cortex-A57 and Cortex-A72
> 
> Yann E. MORIN (1):
>       arch/arm: drop legacy dependency for floating point strategy

Thanks, I've applied all 8 patches. I've added another patch that
allows selecting the Linaro ARM and ARMeb toolchains on ARMv8.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
