From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 14:08:42 +0200
Subject: [Buildroot] [PATCH 11/12] package/libblockdev: add
 gobject-introspection support
In-Reply-To: <20200723010810.3237608-12-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
 <20200723010810.3237608-12-aduskett@gmail.com>
Message-ID: <20200723140842.4b8dcde3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jul 2020 18:08:09 -0700
aduskett at gmail.com wrote:

> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBBLOCKDEV_DEPENDENCIES += gobject-introspection
> +LIBBLOCKDEV_CONF_OPTS += --enable-introspection=yes

Just --enable-introspection

> +else
> +LIBBLOCKDEV_CONF_OPTS += --enable-introspection=no

--disable-introspection

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
