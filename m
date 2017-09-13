From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Wed, 13 Sep 2017 13:05:26 +0100
Subject: [Buildroot] [PATCH 1/1] configs/galileo: update to kernel with
 gcc6 fix
In-Reply-To: <20170904224839.8036-1-sielicki@yandex.com>
References: <20170904224839.8036-1-sielicki@yandex.com>
Message-ID: <56bf6f12-8220-8481-c7b3-08eb6f7a9d17@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for doing this Nicholas!

Ray K

On 04/09/2017 23:48, Nicholas Sielicki wrote:
> The kernel used for the galileo boards would not successfully build with
> GCC versions greater than 5.
>
> See: https://github.com/mdr78/Linux-x1000/pull/2
>
> Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
> ---
>  configs/galileo_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
> index 43639a41a..7db3cfe8a 100644
> --- a/configs/galileo_defconfig
> +++ b/configs/galileo_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/galileo/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mdr78/Linux-x1000.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="0feded4f96ddca9816c6c1b8a4780cb4065747b9"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8b3c9d8ce1656a26b1097d9091d53bfb39fef640"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/intel/galileo/linux-3.14.config"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
>
