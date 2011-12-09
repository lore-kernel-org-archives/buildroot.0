From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Dec 2011 19:40:26 +0100
Subject: [Buildroot] [PATCH] Add new package libmbus Library for
 communicating with energy metering devices
In-Reply-To: <1323434376-22948-1-git-send-email-sagaert.johan@skynet.be>
References: <1323434376-22948-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20111209194026.7d615186@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri,  9 Dec 2011 13:39:36 +0100,
Sagaert Johan <sagaert.johan@skynet.be> a ?crit :

> +LIBMBUS_VERSION:=0.6.1
> +LIBMBUS_SOURCE:=libmbus-$(LIBMBUS_VERSION).tar.gz
> +LIBMBUS_SITE:=http://www.freescada.com/public-dist/

'=' signs should be used instead of ':=' signs.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
