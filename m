From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Jan 2019 14:18:33 +0100
Subject: [Buildroot] [PATCH v4 1/3] arch: add support for RISC-V 32-bit
 (riscv32) architecture
In-Reply-To: <20181021191203.2148-1-mark.corbin@embecosm.com>
References: <20181021191203.2148-1-mark.corbin@embecosm.com>
Message-ID: <20190106141833.7a6ebc9e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 20:12:01 +0100, Mark Corbin wrote:
> This enables a riscv32 system to be built with a Buildroot generated
> toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).
> 
> This requires a custom version of glibc 2.26 from the riscv-glibc
> repository. Note that there are no tags in this repository, so the
> glibc version just consists of the 40 character commit id string.
> 
> Thanks to Fabrice Bellard for pointing me towards the 32-bit glibc
> repository and for providing the necessary patch to get it to build.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
> Changes v3 -> v4:
>   - added choice for selecting 32-bit or 64-bit in Config.in.riscv
>     This provides a new variable BR2_RISCV_32

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
