From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Aug 2018 09:30:39 +0200
Subject: [Buildroot] [PATCH v2 1/1] boot/uboot: missing dtc build
 dependency
In-Reply-To: <20180801143336.25420-1-david.degrave@mind.be>
References: <20180801143336.25420-1-david.degrave@mind.be>
Message-ID: <20180802093039.4e3d5eac@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Aug 2018 16:33:36 +0200, David De Grave (Essensium/Mind)
wrote:

> diff --git a/boot/uboot/2018.01/0001-missing-dtc-dependency-in-kconfig.patch b/boot/uboot/2018.01/0001-missing-dtc-dependency-in-kconfig.patch

This is only going to fix the problem for U-Boot 2018.01, which isn't
even our default U-Boot version. I'm not sure it makes sense to carry a
patch for that particular U-Boot version.

In addition, we require all patches to have a description +
Signed-off-by.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
