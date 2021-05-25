From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 25 May 2021 05:15:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20210524
In-Reply-To: <20210524180552.17283-1-petr.vorel@gmail.com>
References: <20210524180552.17283-1-petr.vorel@gmail.com>
Message-ID: <YKxr1l3AqGT+hMKr@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Add locally computed sha256 (+ keep sha1 from github checksum file).

> sysinfo.h fix patch is still needed (until Buildroot MUSL toolchain gets
> updated).
tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed

                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
             bootlin-microblazeel-uclibc [ 9/45]: OK
                   bootlin-mipsel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                bootlin-m68k-5208-uclibc [12/45]: SKIPPED
               bootlin-m68k-68040-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: SKIPPED
                 bootlin-openrisc-uclibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
        bootlin-powerpc64le-power8-glibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                    bootlin-sparc-uclibc [22/45]: SKIPPED
                   bootlin-sparc64-glibc [23/45]: OK
                   bootlin-xtensa-uclibc [24/45]: OK
                    bootlin-x86-64-glibc [25/45]: OK
                     bootlin-x86-64-musl [26/45]: OK
                   bootlin-x86-64-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: OK
                br-i386-pentium-mmx-musl [31/45]: OK
                   br-i386-pentium4-full [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                           sourcery-mips [43/45]: OK
                         sourcery-mips64 [44/45]: OK
                          sourcery-nios2 [45/45]: SKIPPED
45 builds, 6 skipped, 0 build failed, 0 legal-info failed
