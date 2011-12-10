From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2011 15:46:19 +0100
Subject: [Buildroot] [PATCH 1/1] New Package libmbus library for
 communicating with M-bus devices.(rework)
In-Reply-To: <1323478080-2915-1-git-send-email-sagaert.johan@skynet.be>
References: <1323478080-2915-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20111210154619.2fdaccf8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

You forgot your Signed-off-by line, which is mandatory.

Le Sat, 10 Dec 2011 01:48:00 +0100,
Sagaert Johan <sagaert.johan@skynet.be> a ?crit :

> +++ b/package/libmbus/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBMBUS
> +	bool "libmbus"
> +	help
> +	  libmbus is a library for communicating with energy metering devices.
> +	  It supports TCP and RS232 M-bus gateways.
> +	  ( M-bus standard : http://www.m-bus.com/ )

Remove space after ( and before ).

> +LIBMBUS_VERSION:=0.6.1

= instead of :=

> +LIBMBUS_SOURCE:=libmbus-$(LIBMBUS_VERSION).tar.gz

Not needed, that's the default.

> +LIBMBUS_SITE:=http://www.freescada.com/public-dist/

= instead of :=

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
