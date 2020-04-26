From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 13:48:55 +0200
Subject: [Buildroot] [PATCH] board/qemu: remove the Qemu version from
 readme.txt
In-Reply-To: <20200426103917.659829-1-romain.naour@gmail.com>
References: <20200426103917.659829-1-romain.naour@gmail.com>
Message-ID: <20200426114855.GA28666@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-04-26 12:39 +0200, Romain Naour spake thusly:
> The Qemu version present in readme.txt files was needed when
> the Buildroot's Qemu defconfig was tested manually using the
> qemu-system-<arch> binary already present on the host.
> 
> This information is now incorrect since we are using host-qemu
> package, currently at 4.2.0 version, to do a runtime test since
> 0c7935063851accf3db4c9eb2fc4f11c3da0c391.
> 
> For m68k-q800, we can use the upstream qemu since 4.2.0 release
> [1].
> 
> So, remove this line from the readme.txt.
> 
> [1] https://www.qemu.org/2019/12/13/qemu-4-2-0/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/qemu/aarch64-virt/readme.txt     | 2 --
>  board/qemu/arm-versatile/readme.txt    | 2 --
>  board/qemu/arm-vexpress-tz/readme.txt  | 2 --
>  board/qemu/arm-vexpress/readme.txt     | 2 --
>  board/qemu/m68k-mcf5208/readme.txt     | 2 --
>  board/qemu/m68k-q800/readme.txt        | 3 ---
>  board/qemu/microblazebe-mmu/readme.txt | 2 --
>  board/qemu/microblazeel-mmu/readme.txt | 2 --
>  board/qemu/mips32r2-malta/readme.txt   | 2 --
>  board/qemu/mips32r2el-malta/readme.txt | 2 --
>  board/qemu/mips32r6-malta/readme.txt   | 2 --
>  board/qemu/mips32r6el-malta/readme.txt | 2 --
>  board/qemu/mips64-malta/readme.txt     | 2 --
>  board/qemu/mips64el-malta/readme.txt   | 2 --
>  board/qemu/mips64r6-malta/readme.txt   | 2 --
>  board/qemu/mips64r6el-malta/readme.txt | 2 --
>  board/qemu/nios2-10m50/readme.txt      | 2 --
>  board/qemu/or1k/readme.txt             | 2 --
>  board/qemu/ppc-g3beige/readme.txt      | 2 --
>  board/qemu/ppc-mac99/readme.txt        | 2 --
>  board/qemu/ppc-mpc8544ds/readme.txt    | 2 --
>  board/qemu/ppc-virtex-ml507/readme.txt | 2 --
>  board/qemu/ppc64-e5500/readme.txt      | 2 --
>  board/qemu/ppc64-pseries/readme.txt    | 2 --
>  board/qemu/ppc64le-pseries/readme.txt  | 2 --
>  board/qemu/riscv32-virt/readme.txt     | 2 --
>  board/qemu/riscv64-virt/readme.txt     | 2 --
>  board/qemu/sh4-r2d/readme.txt          | 2 --
>  board/qemu/sh4eb-r2d/readme.txt        | 2 --
>  board/qemu/sparc-ss10/readme.txt       | 2 --
>  board/qemu/sparc64-sun4u/readme.txt    | 2 --
>  board/qemu/x86/readme.txt              | 2 --
>  board/qemu/x86_64/readme.txt           | 2 --
>  board/qemu/xtensa-lx60/readme.txt      | 2 --
>  34 files changed, 69 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
