From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 22:03:32 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: add version 5.8
In-Reply-To: <20200905150507.32733-1-peter@korsgaard.com>
References: <20200905150507.32733-1-peter@korsgaard.com>
Message-ID: <20200905220332.5e73b7ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Sep 2020 17:05:06 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  linux/Config.in                                     |  4 ++--
>  linux/linux.hash                                    |  1 +
>  package/linux-headers/Config.in.host                | 13 +++++++++++--
>  toolchain/Config.in                                 |  5 +++++
>  .../toolchain-external-custom/Config.in.options     |  6 +++++-
>  5 files changed, 24 insertions(+), 5 deletions(-)

Applied to master, thanks. This will fix 4 defconfigs that are already
referencing 5.8 kernel headers:

configs/nanopc_t4_defconfig:BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
configs/nanopi_m4_defconfig:BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
configs/orangepi_rk3399_defconfig:BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
configs/rockpro64_defconfig:BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
