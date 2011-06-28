From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jun 2011 10:48:41 +0200
Subject: [Buildroot] [PATCH] New packages: acl and attr
In-Reply-To: <4E09922C.6060803@visionsystems.de>
References: <4E09922C.6060803@visionsystems.de>
Message-ID: <20110628104841.731f2371@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 28 Jun 2011 10:34:52 +0200,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

This:

> +ACL_INSTALL_STAGING_OPT = prefix=$(STAGING_DIR)/usr exec_prefix=$(TARGET_DIR)/usr PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib install-dev install-lib
> +ACL_INSTALL_TARGET_OPT = prefix=$(TARGET_DIR)/usr exec_prefix=$(TARGET_DIR)/usr install install-lib

and this:

> +ATTR_INSTALL_STAGING_OPT = prefix=$(STAGING_DIR)/usr exec_prefix=$(STAGING_DIR)/usr PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib install-dev install-lib
> +ATTR_INSTALL_TARGET_OPT = prefix=$(TARGET_DIR)/usr exec_prefix=$(TARGET_DIR)/usr install install-lib

requires justification. It apparently looks strange and unnecessary. So
if it is actually needed, a comment explaining why would be useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
