From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 23:27:53 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libmspack: new package
In-Reply-To: <20191005205921.31593-1-bernd.kuhls@t-online.de>
References: <20191005205921.31593-1-bernd.kuhls@t-online.de>
Message-ID: <20191010232753.37857947@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Oct 2019 22:59:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed for upcoming clamav version bump to 0.102.0.
> 
> Package passed test-pkg:
> 
>                              andes-nds32 [ 1/44]: OK
>                              arm-aarch64 [ 2/44]: OK
>                         br-aarch64-glibc [ 3/44]: OK
>                            br-arcle-hs38 [ 4/44]: OK
>                             br-arm-basic [ 5/44]: OK
>                   br-arm-cortex-a9-glibc [ 6/44]: OK
>                    br-arm-cortex-a9-musl [ 7/44]: OK
>                    br-arm-cortex-m4-full [ 8/44]: OK
>                              br-arm-full [ 9/44]: OK
>                     br-arm-full-nothread [10/44]: OK
>                       br-arm-full-static [11/44]: OK
>                    br-i386-pentium4-full [12/44]: OK
>                 br-i386-pentium-mmx-musl [13/44]: OK
>                        br-m68k-5208-full [14/44]: OK
>                       br-m68k-68040-full [15/44]: OK
>                     br-microblazeel-full [16/44]: OK
>                  br-mips32r6-el-hf-glibc [17/44]: OK
>                       br-mips64-n64-full [18/44]: OK
>                  br-mips64r6-el-hf-glibc [19/44]: OK
>                       br-mipsel-o32-full [20/44]: OK
>                           br-nios2-glibc [21/44]: OK
>                       br-openrisc-uclibc [22/44]: OK
>                br-powerpc-603e-basic-cpp [23/44]: OK
>              br-powerpc64le-power8-glibc [24/44]: OK
>                br-powerpc64-power7-glibc [25/44]: OK
>                   br-powerpc-e500mc-full [26/44]: OK
>                               br-riscv32 [27/44]: OK
>                               br-riscv64 [28/44]: OK
>                              br-sh4-full [29/44]: OK
>                         br-sparc64-glibc [30/44]: OK
>                          br-sparc-uclibc [31/44]: OK
>                     br-x86-64-core2-full [32/44]: OK
>                           br-x86-64-musl [33/44]: OK
>                           br-xtensa-full [34/44]: OK
>                        linaro-aarch64-be [35/44]: OK
>                           linaro-aarch64 [36/44]: OK
>                               linaro-arm [37/44]: OK
>                      sourcery-arm-armv4t [38/44]: OK
>                             sourcery-arm [39/44]: OK
>                      sourcery-arm-thumb2 [40/44]: OK
>                          sourcery-mips64 [41/44]: OK
>                            sourcery-mips [42/44]: OK
>                           sourcery-nios2 [43/44]: OK
>                          sourcery-x86-64 [44/44]: OK
> 44 builds, 0 skipped, 0 build failed, 0 legal-info failed
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: no changes

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
