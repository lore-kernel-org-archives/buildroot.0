From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 25 Mar 2021 21:17:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmbim: bump version to 1.24.6
In-Reply-To: <20210325180023.20646-1-petr.vorel@gmail.com>
References: <20210325180023.20646-1-petr.vorel@gmail.com>
Message-ID: <YFzv1JrMjll9Lbgg@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Tested:
                             andes-nds32 [ 1/45]: FAILED
configure: error: "libffi has not been ported to nds32le-buildroot-linux-gnu."
=> again not caused by this patch

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
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
        bootlin-powerpc64le-power8-glibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                    bootlin-sparc-uclibc [22/45]: OK
                   bootlin-sparc64-glibc [23/45]: OK

                   bootlin-xtensa-uclibc [24/45]: FAILED
checking for getaddrinfo... no

Fatal: You must get working getaddrinfo() function.
       or you can specify "--disable-ipv6".
make: *** [package/pkg-generic.mk:240: bootlin-xtensa-uclibc/build/host-python3-3.9.2/.stamp_configured] Error 1
=> host-python3 broken, not related to this patch

                    bootlin-x86-64-glibc [25/45]: SKIPPED
                     bootlin-x86-64-musl [26/45]: SKIPPED
                   bootlin-x86-64-uclibc [27/45]: SKIPPED
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: SKIPPED
                br-i386-pentium-mmx-musl [31/45]: SKIPPED
                   br-i386-pentium4-full [32/45]: SKIPPED
                 br-mips64r6-el-hf-glibc [34/45]: SKIPPED
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: SKIPPED
                       linaro-aarch64-be [37/45]: SKIPPED
                          linaro-aarch64 [38/45]: SKIPPED
                              linaro-arm [39/45]: SKIPPED
                     sourcery-arm-armv4t [40/45]: SKIPPED
                            sourcery-arm [41/45]: SKIPPED
                     sourcery-arm-thumb2 [42/45]: SKIPPED
                           sourcery-mips [43/45]: SKIPPED
                         sourcery-mips64 [44/45]: SKIPPED
                          sourcery-nios2 [45/45]: SKIPPED


Kind regards,
Petr
