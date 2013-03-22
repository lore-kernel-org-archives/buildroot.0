From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Mar 2013 13:58:25 +0100
Subject: [Buildroot] [PATCH 2/2] configs: add RaspberryPi defconfig
In-Reply-To: <1358087034-2706-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1358087034-2706-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1358087034-2706-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20130322135825.1d097827@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 13 Jan 2013 15:23:54 +0100, Maxime Hadjinlian wrote:
> diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
> new file mode 100644
> index 0000000..8c73d0e
> --- /dev/null
> +++ b/configs/rpi_defconfig
> @@ -0,0 +1,19 @@
> +BR2_arm=y
> +BR2_arm1176jzf_s=y
> +
> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Please add:

# Lock to 3.8 headers to avoid breaking with newer kernels
BR2_KERNEL_HEADERS_3_8=y

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
