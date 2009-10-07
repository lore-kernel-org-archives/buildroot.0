From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 12:59:09 +0200
Subject: [Buildroot] [PATCH 07/23] qt: remove PKG_CONFIG workaround
In-Reply-To: <200910071219.18055.mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-8-git-send-email-mroth@nessie.de>
	<20091007114401.16c6df30@surf> <200910071219.18055.mroth@nessie.de>
Message-ID: <20091007125909.27bb167d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 7 Oct 2009 12:19:10 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> There is no PKG_CONFIG_SYSROOT but PKG_CONFIG_SYSROOT_DIR.

Oh indeed. My mistake, your patch is fully correct.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
