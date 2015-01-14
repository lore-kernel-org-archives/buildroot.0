From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 23:06:28 +0100
Subject: [Buildroot] [PATCH v2 1/3] gpu-amd-bin-mx51: new package
In-Reply-To: <1417252360-10929-2-git-send-email-jezz@sysmic.org>
References: <1417252360-10929-1-git-send-email-jezz@sysmic.org>
 <1417252360-10929-2-git-send-email-jezz@sysmic.org>
Message-ID: <20150114230628.4a382640@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Sat, 29 Nov 2014 10:12:38 +0100, J?r?me Pouiller wrote:
> Freescale libraries, headers and executables for the
> AMD GPU on the i.MX51, containing OpenGL/ES, OpenVG
> and EGL support.
> 
> Tested using:
>     mx5loco_defconfig:
>     BR2_TOOLCHAIN_EXTERNAL=y
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
>     BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53=y
>     BR2_PACKAGE_GPU_AMD_BIN_MX51=y
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Thanks, applied. I only did some minor Config.in formatting cleanup
when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
