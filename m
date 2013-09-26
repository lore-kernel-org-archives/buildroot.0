From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Sep 2013 21:37:36 +0200
Subject: [Buildroot] [PATCH] configs: add Freescale i.MX 6SoloLite EVK
	support
In-Reply-To: <1380185523-26736-1-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Thu, 26 Sep 2013 10:52:02 +0200")
References: <1380185523-26736-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <87fvsr5q7z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> i.MX6 SoloLite EVK is Freescale's evaluation board based on
 Gilles> the i.MX6 SoloLite applications processor.

 Gilles> This defconfig is based off Freescale "official" git repo on git.freescale.com
 Gilles> and SW release 3.0.35_4.1.0.

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles>  configs/freescale_imx6sololiteevk_defconfig |   15 +++++++++++++++
 Gilles>  1 file changed, 15 insertions(+)
 Gilles>  create mode 100644 configs/freescale_imx6sololiteevk_defconfig

 Gilles> diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
 Gilles> new file mode 100644
 Gilles> index 0000000..7ed6e6c
 Gilles> --- /dev/null
 Gilles> +++ b/configs/freescale_imx6sololiteevk_defconfig
 Gilles> @@ -0,0 +1,15 @@
 Gilles> +BR2_arm=y
 Gilles> +BR2_cortex_a9=y
 Gilles> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y

Why do you want static device nodes?

-- 
Bye, Peter Korsgaard
