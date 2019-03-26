From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 13:31:35 +0100
Subject: [Buildroot] [PATCH v6 2/5] board/qemu/riscv32-virt: Simplify
 the linux config
In-Reply-To: <20190320230422.13592-2-alistair.francis@wdc.com>
References: <20190320230422.13592-1-alistair.francis@wdc.com>
 <20190320230422.13592-2-alistair.francis@wdc.com>
Message-ID: <20190326133135.1d4463ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Mar 2019 23:05:21 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> Reduce the config fragment to the bare minimum to enable 32-bit
> support. This means we are as close as possible to the arch
> defconfig.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  board/qemu/riscv32-virt/linux.config.fragment | 100 +-----------------
>  1 file changed, 4 insertions(+), 96 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
