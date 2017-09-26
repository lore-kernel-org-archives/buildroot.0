From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:04:29 +0200
Subject: [Buildroot] [PATCH 1/2] configs: qemu_ppc64_pseries: Update to
 kernel 4.13.1
In-Reply-To: <20170920024845.26157-2-joel@jms.id.au>
References: <20170920024845.26157-1-joel@jms.id.au>
 <20170920024845.26157-2-joel@jms.id.au>
Message-ID: <61b878ac-d766-c6d5-88fb-3890415ca974@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-09-17 04:48, Joel Stanley wrote:
> Drop the custom headers bit as it is not required.

 This is not actually true, you kept the custom headers bit.

 I updated the commit message and applied to master, thanks.

 Regards,
 Arnout

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  configs/qemu_ppc64_pseries_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
> index 7af20e989d0c..84076314d961 100644
> --- a/configs/qemu_ppc64_pseries_defconfig
> +++ b/configs/qemu_ppc64_pseries_defconfig
> @@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
>  BR2_TARGET_ROOTFS_EXT2=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  
> -# Linux headers same as kernel, a 4.11 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
> +# Linux headers same as kernel, a 4.13 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.1"
>  BR2_LINUX_KERNEL_DEFCONFIG="pseries"
>  BR2_LINUX_KERNEL_VMLINUX=y
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
