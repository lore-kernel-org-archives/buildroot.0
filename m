From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jun 2013 09:13:05 +0200
Subject: [Buildroot] [PATCH 2/6] package/linux-firmware: bump version
 for new firmware
In-Reply-To: <97ba0d959c1ec97eea764c84f57d1e2d5e99bff4.1370289131.git.yann.morin.1998@free.fr>
References: <cover.1370289131.git.yann.morin.1998@free.fr>
 <97ba0d959c1ec97eea764c84f57d1e2d5e99bff4.1370289131.git.yann.morin.1998@free.fr>
Message-ID: <20130604091305.6fdc8fdc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  3 Jun 2013 22:15:48 +0200, Yann E. MORIN wrote:

> -config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192
> -	bool "Realtek 8192"
> +config BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX
> +	bool "Realtek 81xx"
>  	help
> -	  Realtek 8192
> +	  Realtek 8188/8192
>  
> -config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
> -	bool "Realtek 8712"
> +config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX
> +	bool "Realtek 87xx"
>  	help
> -	  Realtek 8712
> +	  Realtek 8712/8723

Warning, warning, warning: renaming of Kconfig options without
Config.in.legacy updates!

I must say I'm proud to be the one who mentions that, even after Peter
reviewed and committed the patch :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
