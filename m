From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 11:52:06 +0200
Subject: [Buildroot] [PATCH 11/23] qt: remove unnecessary call to qstrip
 macro in Makefile
In-Reply-To: <1254907246-5650-12-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-12-git-send-email-mroth@nessie.de>
Message-ID: <20091007115206.35aaedd9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:34 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> QT_CONFIGURE can never gain double quotes, so there
> is no point to remove some.
> 
> Signed-off-by: Michael Roth <mroth@nessie.de>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
