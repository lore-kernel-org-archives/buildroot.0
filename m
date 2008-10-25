From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2008 20:54:24 +0200
Subject: [Buildroot] [PATCH] package: remove/replace PKG_CONFIG_SYSROOT
In-Reply-To: <200810250108.06823.markus.heidelberg@web.de>
References: <200810250108.06823.markus.heidelberg@web.de>
Message-ID: <20081025205424.78d812d4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 25 Oct 2008 01:08:06 +0200,
Markus Heidelberg <markus.heidelberg@web.de> a ?crit :

> PKG_CONFIG_SYSROOT is not recognized by pkg-config,
> PKG_CONFIG_SYSROOT_DIR is the valid environment variable name.

These variables are already defined in TARGET_CONFIGURE_OPTS in
package/Makefile.in. Just drop them in your packages.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
