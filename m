From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:53:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/lightning: bump version to 2.1.3
In-Reply-To: <20191006153115.15542-1-bernd.kuhls@t-online.de>
References: <20191006153115.15542-1-bernd.kuhls@t-online.de>
Message-ID: <20191007225307.71bfe5af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 17:31:15 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> https://lists.gnu.org/archive/html/lightning/2019-09/msg00033.html
> "2.1.3 main features are the new RISC-V port, currently supporting
>  only Linux 64 bit"
> 
> Build-tested using this defconfig:
> 
> BR2_riscv=y
> BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_LIGHTNING=y
> BR2_PACKAGE_LIGHTNING_DISASSEMBLER=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/lightning/Config.in      | 4 ++--
>  package/lightning/lightning.hash | 2 +-
>  package/lightning/lightning.mk   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
