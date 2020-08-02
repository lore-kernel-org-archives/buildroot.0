From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 2 Aug 2020 11:14:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmbim: bump version to 1.24.2
In-Reply-To: <20200731231930.20337-1-petr.vorel@gmail.com>
References: <20200731231930.20337-1-petr.vorel@gmail.com>
Message-ID: <20200802091425.GA74210@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> tested (failure in andes-nds32 is due libffi not being ported to
> nds32le-buildroot-linux-gnu => usual error).

> Kind regards,
> Petr
>                              andes-nds32 [ 1/45]: FAILED
>                              arm-aarch64 [ 2/45]: OK
>                         br-aarch64-glibc [ 3/45]: OK
>                            br-arcle-hs38 [ 4/45]: OK
>                             br-arm-basic [ 5/45]: SKIPPED
>                   br-arm-cortex-a9-glibc [ 6/45]: OK
>                    br-arm-cortex-a9-musl [ 7/45]: OK
>                    br-arm-cortex-m4-full [ 8/45]: SKIPPED
>                              br-arm-full [ 9/45]: OK
>                     br-arm-full-nothread [10/45]: SKIPPED
>                       br-arm-full-static [11/45]: OK
>                 br-i386-pentium-mmx-musl [12/45]: OK
>                    br-i386-pentium4-full [13/45]: OK
>                     br-microblazeel-full [14/45]: OK
>                       br-mipsel-o32-full [15/45]: OK
>                  br-mips32r6-el-hf-glibc [16/45]: OK
>                       br-mips64-n64-full [17/45]: OK
>                  br-mips64r6-el-hf-glibc [18/45]: OK
>                        br-m68k-5208-full [19/45]: SKIPPED
>                       br-m68k-68040-full [20/45]: OK
>                           br-nios2-glibc [21/45]: OK
>                       br-openrisc-uclibc [22/45]: OK
>                   br-powerpc-e500mc-full [23/45]: OK
>                br-powerpc-603e-basic-cpp [24/45]: SKIPPED
>              br-powerpc64le-power8-glibc [25/45]: OK
>                br-powerpc64-power7-glibc [26/45]: OK
>                               br-riscv32 [27/45]: OK
>                               br-riscv64 [28/45]: OK
>                          br-riscv64-musl [29/45]: OK
>                              br-sh4-full [30/45]: OK
>                          br-sparc-uclibc [31/45]: OK
>                         br-sparc64-glibc [32/45]: OK
>                           br-xtensa-full [33/45]: OK
>                     br-x86-64-core2-full [34/45]: OK
>                           br-x86-64-musl [35/45]: OK
>                        linaro-aarch64-be [36/45]: OK

Tested the rest:
                          linaro-aarch64 [37/45]: OK
                              linaro-arm [38/45]: OK
                     sourcery-arm-armv4t [39/45]: OK
                            sourcery-arm [40/45]: OK
                     sourcery-arm-thumb2 [41/45]: OK
                           sourcery-mips [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                          sourcery-nios2 [44/45]: OK
                         sourcery-x86-64 [45/45]: OK
45 builds, 5 skipped, 1 build failed, 0 legal-info failed

Kind regards,
Petr
