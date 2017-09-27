From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 21:39:44 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain-external: bump version of
 Linaro ARM toolchain to 2017.08
In-Reply-To: <20170925200812.4917-1-romain.naour@gmail.com>
References: <20170925200812.4917-1-romain.naour@gmail.com>
Message-ID: <20170927213944.181e1b55@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Sep 2017 22:08:10 +0200, Romain Naour wrote:
> GDB has been updated to 8.0 version in the release.
> 
> https://releases.linaro.org/components/toolchain/binaries/6.4-2017.08
> 
> Tested with qemu_arm_vexpress_defconfig.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../toolchain-external/toolchain-external-linaro-arm/Config.in    | 6 +++---
>  .../toolchain-external-linaro-arm.hash                            | 4 ++--
>  .../toolchain-external-linaro-arm.mk                              | 8 ++++----
>  3 files changed, 9 insertions(+), 9 deletions(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
