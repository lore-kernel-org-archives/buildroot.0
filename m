From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 11:40:43 +0200
Subject: [Buildroot] [PATCH 03/23] qt: enable proper re-configure
In-Reply-To: <1254907246-5650-4-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-4-git-send-email-mroth@nessie.de>
Message-ID: <20091007114043.72c86b4f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:26 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> The Qt configure script doesn't use config.cache but the
> generated Makefile provides a confclean target to properly
> clean out old configuration.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
