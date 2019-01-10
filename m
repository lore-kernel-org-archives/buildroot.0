From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jan 2019 21:32:15 +0100
Subject: [Buildroot] [PATCH v4 3/3] support/config-fragments: add RISC-V
 32-bit to autobuild configs
In-Reply-To: <20181021191203.2148-3-mark.corbin@embecosm.com>
References: <20181021191203.2148-1-mark.corbin@embecosm.com>
 <20181021191203.2148-3-mark.corbin@embecosm.com>
Message-ID: <20190110213215.17b8de76@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 20:12:03 +0100, Mark Corbin wrote:
> Add a minimal RISC-V 32-bit autobuild configuration for the
> internal toolchain with glibc.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> 
> ---
> Changes v3 -> v4:
>   - set new variable BR2_RISCV_32 in br-riscv32-internal-glibc.config
> ---
>  .../autobuild/br-riscv32-internal-glibc.config                 | 3 +++
>  support/config-fragments/autobuild/toolchain-configs.csv       | 1 +
>  2 files changed, 4 insertions(+)
>  create mode 100644 support/config-fragments/autobuild/br-riscv32-internal-glibc.config

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
