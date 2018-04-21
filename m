From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Apr 2018 14:59:26 +0200
Subject: [Buildroot] [PATCH] support/config-fragments/autobuild: update
 all Buildroot pre-built toolchains
In-Reply-To: <20180419202654.25169-1-thomas.petazzoni@bootlin.com>
References: <20180419202654.25169-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180421145926.527efafe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Apr 2018 22:26:54 +0200, Thomas Petazzoni wrote:
> This commit updates all the pre-built Buildroot toolchains, which have
> all been rebuilt with Buildroot as of commit 046c5e2. The initial
> motivation for this update is that an upcoming bump of procps-ng uses
> fopencookie(), which has only been introduced in musl 1.1.19, which
> itself started being used in Buildroot after the 2018.02 release.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/config-fragments/autobuild/br-aarch64-glibc.config           | 2 +-
>  support/config-fragments/autobuild/br-arcle-hs38.config              | 2 +-
>  support/config-fragments/autobuild/br-arm-basic.config               | 4 ++--
>  support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config     | 4 ++--
>  support/config-fragments/autobuild/br-arm-cortex-a9-musl.config      | 4 ++--
>  support/config-fragments/autobuild/br-arm-cortex-m4-full.config      | 4 ++--
>  support/config-fragments/autobuild/br-arm-full-nothread.config       | 4 ++--
>  support/config-fragments/autobuild/br-arm-full-static.config         | 4 ++--
>  support/config-fragments/autobuild/br-arm-full.config                | 4 ++--
>  support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config   | 4 ++--
>  support/config-fragments/autobuild/br-i386-pentium4-full.config      | 2 +-
>  support/config-fragments/autobuild/br-m68k-5208-full.config          | 4 ++--
>  support/config-fragments/autobuild/br-m68k-68040-full.config         | 4 ++--
>  support/config-fragments/autobuild/br-microblazeel-full.config       | 3 +--
>  support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config    | 4 ++--
>  support/config-fragments/autobuild/br-mips64-n64-full.config         | 4 ++--
>  support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config    | 4 ++--
>  support/config-fragments/autobuild/br-mipsel-o32-full.config         | 4 ++--
>  support/config-fragments/autobuild/br-nios2-glibc.config             | 4 ++--
>  support/config-fragments/autobuild/br-openrisc-uclibc.config         | 5 ++---
>  support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config  | 4 ++--
>  support/config-fragments/autobuild/br-powerpc-e500mc-full.config     | 4 ++--
>  support/config-fragments/autobuild/br-powerpc64-power7-glibc.config  | 4 ++--
>  .../config-fragments/autobuild/br-powerpc64le-power8-glibc.config    | 4 ++--
>  support/config-fragments/autobuild/br-sh4-full.config                | 4 ++--
>  support/config-fragments/autobuild/br-sparc-uclibc.config            | 2 +-
>  support/config-fragments/autobuild/br-sparc64-glibc.config           | 2 +-
>  support/config-fragments/autobuild/br-x86-64-core2-full.config       | 4 ++--
>  support/config-fragments/autobuild/br-x86-64-musl.config             | 4 ++--
>  support/config-fragments/autobuild/br-xtensa-full.config             | 4 ++--
>  30 files changed, 54 insertions(+), 56 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
