From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2011 15:33:14 +0100
Subject: [Buildroot] [PATCH 1/1] New package gsl The GNU Scientific
 Library.
In-Reply-To: <1323699948-25758-1-git-send-email-sagaert.johan@skynet.be>
References: <1323699948-25758-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20111212153314.63d6bdb2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 12 Dec 2011 15:25:48 +0100,
Sagaert Johan <sagaert.johan@skynet.be> a ?crit :

> +GSL_VERSION = 1.15
> +GSL_SITE = ftp://ftp.gnu.org/gnu/gsl/

use BR2_GNU_MIRROR here.

> +GSL_INSTALL_STAGING = YES
> +GSL_INSTALL_TARGET = YES

This line can be removed, that's the default.

Thanks again for this new package!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
