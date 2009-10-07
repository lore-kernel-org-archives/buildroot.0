From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 11:42:53 +0200
Subject: [Buildroot] [PATCH 06/23] qt: remove TARGET_CONFIGURE_OPTS from
 make invocation
In-Reply-To: <1254907246-5650-7-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-7-git-send-email-mroth@nessie.de>
Message-ID: <20091007114253.19bf591f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:29 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> All compiler options, switches and path settings are done in the
> configure step. For the compile and install step there is no need
> for the TARGET_CONFIGURE_OPTS variables.
> 
> Signed-off-by: Michael Roth <mroth@nessie.de>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
