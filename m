From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 22:30:43 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Set MAKE_ENV for kconfig
 build system
In-Reply-To: <20180905122236.26364-1-thomas.preston@codethink.co.uk>
References: <20180905122236.26364-1-thomas.preston@codethink.co.uk>
Message-ID: <20180905223043.5171d38c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Sep 2018 13:22:36 +0100, Thomas Preston wrote:
> U-Boot fails to build in a GitLab CI context because the kconfig-package
> build stage is unable to find bison or flex even though they are
> installed in HOST_DIR.
> 
> To fix this, set UBOOT_MAKE_ENV so that UBOOT_KCONFIG_MAKE uses the
> correct PATH.
> 
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> ---
>  boot/uboot/uboot.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
