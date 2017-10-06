From: daggs <daggs@gmx.com>
Date: Fri, 6 Oct 2017 14:26:29 +0200
Subject: [Buildroot] [PATCH] odroidc2_defconfig: bump kernel and u-boot
 versions
In-Reply-To: <20171005192637.19310-1-peter@korsgaard.com>
References: <20171005192637.19310-1-peter@korsgaard.com>
Message-ID: <trinity-07ae3f61-868d-4a5a-82d7-d6cf77f26f36-1507292789886@3c-app-mailcom-bs07>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Peter,

> Sent: Thursday, October 05, 2017 at 10:26 PM
> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Cc: daggs at gmx.com
> Subject: [Buildroot] [PATCH] odroidc2_defconfig: bump kernel and u-boot versions
>
> To the latest commits on the odroidc2-3.14.y / odroidc2-v2015.01 branches.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  configs/odroidc2_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
> index f2d82296db..f52f29adeb 100644
> --- a/configs/odroidc2_defconfig
> +++ b/configs/odroidc2_defconfig
> @@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a7fe6f2258e30c7a547908b5480bdbe6b56d6d3c"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f966ebfc0e8dc88c7931b4640b8a1b4bc2e13faa"
>  BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
> @@ -28,7 +28,7 @@ BR2_LINUX_KERNEL_IMAGE=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_CUSTOM_GIT=y
>  BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="eb5d2d16fd45f52ec49e9b4ff9d562630c08e61c"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="cff3edb675933ea2e2ecd659eab127a42f3777df"
>  BR2_TARGET_UBOOT_BOARDNAME="odroidc2"
>  
>  # Required tools to create the SD image
> -- 
> 2.11.0

do you know by any chance if it was tested? if not, I'd like to test it before it gets pushed if it is ok by you.

Dagg.
