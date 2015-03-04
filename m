From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 04 Mar 2015 22:58:49 +0100
Subject: [Buildroot] [git commit] rpi-firmware: remove no longer used
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
In-Reply-To: <20150304202748.6C184817F9@busybox.osuosl.org>
References: <20150304202748.6C184817F9@busybox.osuosl.org>
Message-ID: <54F78019.7020603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/03/15 21:27, Thomas Petazzoni wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=4e92ffdc47cc4c857c5d635b4583a61bc4b3cb08
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/rpi-firmware/Config.in |   11 -----------
>  1 files changed, 0 insertions(+), 11 deletions(-)
> 
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index 80ba88a..cd45be4 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -45,15 +45,4 @@ config BR2_PACKAGE_RPI_FIRMWARE_BOOT
>  	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X
>  	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
>  
> -config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS

 Is there no legacy handling needed?

 Regards,
 Arnout


> -	bool "Install Device Tree Blobs (DTBs)"
> -	help
> -	  Say 'y' here if you want to boot your kernel that has support
> -	  for the device tree.
> -
> -	  Note that the defconfig files in the Raspberry Pi fork of the
> -	  Linux kernel do not enable support for the Device Tree. You'll
> -	  have to provide your own Linux config or defconfig file with
> -	  device tree enabled, to make use of those DTBs.
> -
>  endif # BR2_PACKAGE_RPI_FIRMWARE
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
