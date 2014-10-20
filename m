From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Oct 2014 10:41:37 +0200
Subject: [Buildroot] [PATCH 1/2] mx53loco: update support
In-Reply-To: <1413790693-8281-1-git-send-email-eric@eukrea.com>
References: <1413790693-8281-1-git-send-email-eric@eukrea.com>
Message-ID: <20141020104137.768ab68f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric B?nard,

On Mon, 20 Oct 2014 09:38:12 +0200, Eric B?nard wrote:

> -# Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_2.6.35_11.09.01"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="imx_2.6.35_maintain"

Since we're using 2.6.35, the kernel headers of the toolchain should
also be fixed to 2.6.35, otherwise we're using 3.17 by default which
may cause some issues.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
