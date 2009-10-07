From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 13:17:09 +0200
Subject: [Buildroot] [PATCH 21/23] qt: add a Kconfig menu entry to
 enable an optional custom qconfig.h
In-Reply-To: <1254907246-5650-22-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-22-git-send-email-mroth@nessie.de>
Message-ID: <20091007131709.26e47770@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:44 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> Don't twiddle with Makfiles, use Kconfig instead.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

To be complete, we should probably provide a way to *generate* such a
configuration file. Qt includes a tool, called qconfig if I remember
correctly, and that allows to graphically generates this configuration.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
