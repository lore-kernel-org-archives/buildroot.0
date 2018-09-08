From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:36:26 +0200
Subject: [Buildroot] [PATCH-next v2] python-zeroconf: new package
In-Reply-To: <20180831092755.16410-1-yegorslists@googlemail.com>
References: <20180831092755.16410-1-yegorslists@googlemail.com>
Message-ID: <20180908233626.007b1516@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Aug 2018 11:27:55 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

I've applied to master, but I had to fix the license.

> +PYTHON_ZEROCONF_VERSION = 0.20.0
> +PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
> +PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/20/d7/418ff6c684ace0f5855ec56c66cfa99ec50443c41693b91e9abcccfa096c
> +PYTHON_ZEROCONF_SETUP_TYPE = setuptools
> +PYTHON_ZEROCONF_LICENSE = LGPL-2.1

The source code says:

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

So the license is LGPL-2.1+, not LGPL-2.1.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
