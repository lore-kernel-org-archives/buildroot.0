From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 15 May 2020 21:34:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump to version
 20200515
In-Reply-To: <20200515145344.13370-1-petr.vorel@gmail.com>
References: <20200515145344.13370-1-petr.vorel@gmail.com>
Message-ID: <20200515193437.GA9805@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

tested.

Kind regards,
Petr

$ ./utils/test-pkg -p ltp-testsuite -a
                             andes-nds32 [ 1/44]: OK
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: OK
                            br-arm-basic [ 5/44]: OK
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: OK
                   br-arm-cortex-m4-full [ 8/44]: SKIPPED
                             br-arm-full [ 9/44]: OK
                    br-arm-full-nothread [10/44]: SKIPPED
                      br-arm-full-static [11/44]: OK
                br-i386-pentium-mmx-musl [12/44]: OK
                   br-i386-pentium4-full [13/44]: OK
                    br-microblazeel-full [14/44]: OK
                      br-mipsel-o32-full [15/44]: OK
                 br-mips32r6-el-hf-glibc [16/44]: OK
                      br-mips64-n64-full [17/44]: OK
                 br-mips64r6-el-hf-glibc [18/44]: OK
                       br-m68k-5208-full [19/44]: SKIPPED
                      br-m68k-68040-full [20/44]: SKIPPED
                          br-nios2-glibc [21/44]: SKIPPED
                      br-openrisc-uclibc [22/44]: OK
                  br-powerpc-e500mc-full [23/44]: OK
               br-powerpc-603e-basic-cpp [24/44]: OK
             br-powerpc64le-power8-glibc [25/44]: OK
               br-powerpc64-power7-glibc [26/44]: OK
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: OK
                         br-sparc-uclibc [30/44]: SKIPPED
                        br-sparc64-glibc [31/44]: OK
                          br-xtensa-full [32/44]: OK
                    br-x86-64-core2-full [33/44]: OK
                          br-x86-64-musl [34/44]: OK
                       linaro-aarch64-be [35/44]: OK
                          linaro-aarch64 [36/44]: OK
                              linaro-arm [37/44]: OK
                     sourcery-arm-armv4t [38/44]: OK
                            sourcery-arm [39/44]: OK
                     sourcery-arm-thumb2 [40/44]: OK
                           sourcery-mips [41/44]: OK
                         sourcery-mips64 [42/44]: OK
                          sourcery-nios2 [43/44]: SKIPPED
                         sourcery-x86-64 [44/44]: OK
44 builds, 7 skipped, 0 build failed, 0 legal-info failed
