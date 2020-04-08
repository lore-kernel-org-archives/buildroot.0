From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 21:45:57 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-vpuwrap: bump
 version to 4.5.1
In-Reply-To: <20200407202044.9924-3-laurent.gauthier_1@oss.nxp.com>
References: <20200407202044.9924-1-laurent.gauthier_1@oss.nxp.com>
 <20200407202044.9924-3-laurent.gauthier_1@oss.nxp.com>
Message-ID: <20200408214557.28b61af4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  7 Apr 2020 22:20:43 +0200
"Laurent Gauthier (OSS)" <laurent.gauthier_1@oss.nxp.com> wrote:

> +IMX_VPUWRAP_MAKE_ENV = PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"

This should not be necessary, if $(HOST_DIR)/bin/pkg-config is used, by
default it points to the PKG_CONFIG_SYSROOT_DIR.

Could you explain why you had to do this change ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
