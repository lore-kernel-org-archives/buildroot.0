From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Mar 2019 08:36:10 +0100
Subject: [Buildroot] [PATCH 1/3] arch: riscv: Add a RISC-V Platform
 option
In-Reply-To: <20190315230540.4311-1-alistair.francis@wdc.com>
References: <20190315230540.4311-1-alistair.francis@wdc.com>
Message-ID: <20190316083610.15c4eea5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alistair,

Thanks for your contribution.

On Fri, 15 Mar 2019 23:06:38 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> Add a RISC-V Platform option. At the moment only QEMU platforms are
> supported, but in the future this can be extended to include real
> hardware platforms (such as the Unleashed board).
> 
> My goal is that this platform will set default config options (such as
> the default defconfig for the kernel) based on the platform value.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

We never describe each and every board using Buildroot options. If we
were to do that, we would have gazillion of options for the thousands
of boards that exist.

So, we are not going to accept this patch. What we do however is add a
number of defconfigs for well known platforms, just like:

  configs/qemu_riscv32_virt_defconfig
  configs/qemu_riscv64_virt_defconfig

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
