From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 21:01:01 +0200
Subject: [Buildroot] [PATCH 1/1] configs/qemu: add
 qemu_riscv64_virt_defconfig
In-Reply-To: <20180831143853.24340-1-mark.corbin@embecosm.com>
References: <20180831143853.24340-1-mark.corbin@embecosm.com>
Message-ID: <20180831210101.0532f151@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Aug 2018 15:38:53 +0100, Mark Corbin wrote:
> Add RISC-V 64-bit defconfig for QEMU virt machine.
> 
> Tested with QEMU 2.12.1
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

Thanks Mark for those contributions. Could you keep your RISC-V
contributions that depend on each other in a patch series, so that the
dependency between the patches is clear ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
