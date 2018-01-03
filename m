From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 21:47:29 +0100
Subject: [Buildroot] [PATCH 03/16] imx-gpu-viv: bump to version 6.2.2.p0
In-Reply-To: <20180103183842.10182-4-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
 <20180103183842.10182-4-gary.bisson@boundarydevices.com>
Message-ID: <20180103214729.1239fa29@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Jan 2018 19:38:29 +0100, Gary Bisson wrote:

> -config BR2_PACKAGE_IMX_GPU_VIV_APITRACE
> -	bool "install apitrace tools"
> -	select BR2_PACKAGE_IMX_GPU_VIV_G2D
> -	select BR2_PACKAGE_LIBPNG
> -	help
> -	  Copy the apitrace tool to the target. Apitrace consists
> -	  of a set of tools to trace, replay and/or inspect OpenGL,
> -	  OpenGL ES APIs calls
> -
> -	  http://apitrace.github.io/
> -
>  config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
>  	bool "install examples"
>  	help
> @@ -78,11 +67,6 @@ config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
>  
>  	  Warning: examples take approximately 150 MB of disk space.
>  
> -config BR2_PACKAGE_IMX_GPU_VIV_G2D
> -	bool "install G2D libraries"
> -	help
> -	  Copy the GPU2D libraries to the target.
> -

You need Config.in.legacy handle for those removed options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
