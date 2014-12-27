From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 21:34:18 +0100
Subject: [Buildroot] [PATCH v5 04/15] gpu-viv-bin-mx6q: fix GLESv2
 support
In-Reply-To: <1418132813-32642-5-git-send-email-jezz@sysmic.org>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <1418132813-32642-5-git-send-email-jezz@sysmic.org>
Message-ID: <20141227213418.4926f577@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue,  9 Dec 2014 14:46:42 +0100, J?r?me Pouiller wrote:
> Tested with:
>     QMX6 board +
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
>     BR2_LINUX_KERNEL=y
>     BR2_LINUX_KERNEL_CUSTOM_GIT=y
>     BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
>     BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9bafbcba67f7bb2a48a5e05998cecb1165aa444f"
>     BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
>     BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
>     BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>     BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-qmx6"
>     BR2_PACKAGE_QT5=y
>     BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
>     BR2_PACKAGE_QT5BASE_EXAMPLES=y
>     BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
>     BR2_PACKAGE_QT5BASE_EGLFS=y
>     BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
>     BR2_PACKAGE_QT5BASE_GIF=y
>     BR2_PACKAGE_QT5BASE_JPEG=y
>     BR2_PACKAGE_QT5BASE_PNG=y
>     BR2_PACKAGE_QT5QUICKCONTROLS=y
>     BR2_PACKAGE_FREESCALE_IMX=y
>     BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
>     BR2_PACKAGE_GPU_VIV_BIN_MX6Q=y
>     BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES=y
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

I've applied your patch. However next time, please add a real commit
log that explains what is going on. Saying how it was tested is
definitely good, but giving some explanation about what is going on
helps to understand the patch, and therefore increases the chance of
getting your patch applied quickly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
