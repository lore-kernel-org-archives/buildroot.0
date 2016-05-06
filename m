From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 May 2016 15:28:26 +0200
Subject: [Buildroot] [PATCH] configs: freescale_imx6ulevk_defconfig: Add
 alsa-utils
In-Reply-To: <1462492045-21257-1-git-send-email-festevam@gmail.com>
References: <1462492045-21257-1-git-send-email-festevam@gmail.com>
Message-ID: <20160506152826.163eeccb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  5 May 2016 20:47:25 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Add support for alsa-utils.
> 
> Also select BR2_TOOLCHAIN_BUILDROOT_WCHAR as this is a requirement
> for alsamixer.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Thanks Fabio! However, as Julien explained, the principle of Buildroot
defconfigs is that they should be "minimal" configuration, i.e
configurations that just build a basic toolchain + bootloader + kernel
+ minimal rootfs with just Busybox.

In addition to those minimal configurations, we have started accepting
"demo" configurations, such as firefly_rk3288_demo_defconfig. But they
should be a bit more "useful" than just having alsa-utils. For example,
firefly_rk3288_demo_defconfig adds Qt5 with OpenGL support, as well as
Qt5 examples.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
