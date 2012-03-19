From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Mar 2012 10:52:07 +0100
Subject: [Buildroot] [PATCH] Added the libtpl package
In-Reply-To: <1332147488-13020-1-git-send-email-spdawson@gmail.com>
References: <1332147488-13020-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120319105207.3a831fb3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 19 Mar 2012 08:58:08 +0000,
spdawson at gmail.com a ?crit :

> +LIBTPL_VERSION = 1.5
> +LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
> +LIBTPL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tpl
> +
> +LIBTPL_INSTALL_STAGING = YES
> +LIBTPL_INSTALL_TARGET = NO

This looks strange. Is it a static-only library? At least a comment
here in the .mk file before those two lines would be needed to explain
why we have this unusual case.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
