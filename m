From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 22:00:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.2.0
In-Reply-To: <20180910163000.23094-1-bernd.kuhls@t-online.de>
References: <20180910163000.23094-1-bernd.kuhls@t-online.de>
Message-ID: <20180910220015.2f363ce0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Sep 2018 18:30:00 +0200, Bernd Kuhls wrote:

> -ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT),y)
> -MESA3D_CONF_OPTS += --enable-texture-float
> -MESA3D_LICENSE_FILES += docs/patents.txt

I was a bit worried about removing this license file, but it turns out
that the reason for unconditionally enabling texture float support is
that the patent has expired, so the feature can now be used without
problem.

Patch applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
