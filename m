From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 19:43:04 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: bump Linaro AArch64
 to 2015.11-2
In-Reply-To: <1454347864-4891-1-git-send-email-romain.naour@gmail.com>
References: <1454347864-4891-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160201194304.7f518886@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon,  1 Feb 2016 18:31:02 +0100, Romain Naour wrote:
> Runtime tested with Qemu 2.3.1 using qemu_aarch64_virt_defconfig.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  toolchain/toolchain-external/Config.in               | 2 +-
>  toolchain/toolchain-external/toolchain-external.hash | 2 +-
>  toolchain/toolchain-external/toolchain-external.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

All three applied. I've changed the symlink logic to only be used with
the older Linaro 2014.09 toolchains (which we still use on 32 bits host
machines), because this logic is not needed for the newer Linaro
toolchains.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
