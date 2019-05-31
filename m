From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 23:03:55 +0200
Subject: [Buildroot] [PATCH V4 00/11] Update arch/csky for buildroot
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
Message-ID: <20190531230355.7d8112bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guo,

On Fri, 31 May 2019 14:38:57 +0800
guoren at kernel.org wrote:

> Guo Ren (11):
>   arch/csky: Add arch.mk.csky for -mcpu=xxx
>   arch/csky: Change DSP to VDSP for -mcpu
>   arch/csky: Add ck860 supported
>   arch/csky: Add FLOAT_ABI compiler options
>   arch/csky: Add ABI variable for toolchain build
>   package/binutils: Add C-SKY support
>   package/gcc: Add C-SKY support
>   package/gdb: Add C-SKY support
>   package/glibc: Add C-SKY support
>   configs/qemu_cskyXXX_virt: new defconfig
>   arch/csky: Enable csky toolchain build

I have applied the entire series to the next branch, except patch
"configs/qemu_cskyXXX_virt: new defconfig".

I made some changes in several patches, especially in the commit logs.
I'll reply to some of the individual patches when I did more than
changing the commit log.

I had to add one patch to package/linux-headers, so that only Linux
kernel versions that have C-SKY support can be selected. This was
missing in your series.

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
