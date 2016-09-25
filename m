From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:12:30 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain-external: bump version of
 Linaro ARM toolchain
In-Reply-To: <1474709873-21387-1-git-send-email-romain.naour@gmail.com>
References: <1474709873-21387-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160925231230.7f931f02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Sep 2016 11:37:51 +0200, Romain Naour wrote:
> The gdb version is 7.11.1 not 7.10 as stated in the link below [1].
> See the manifest to check the version really used [2].
> 
> Tested with Qemu 2.4.1 and qemu_arm_vexpress_defconfig.
> 
> [1] https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05
> [2] https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/arm-linux-gnueabihf/gcc-linaro-5.3.1-2016.05-linux-manifest.txt
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/Config.in               | 6 +++---
>  toolchain/toolchain-external/toolchain-external.hash | 2 +-
>  toolchain/toolchain-external/toolchain-external.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

All three patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
