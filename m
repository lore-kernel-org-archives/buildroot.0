From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 11:59:41 +0200
Subject: [Buildroot] [PATCH 14/23] qt: make the output of sed hacks much
 more human readable
In-Reply-To: <1254907246-5650-15-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-15-git-send-email-mroth@nessie.de>
Message-ID: <20091007115941.54d4089f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:37 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> Make the console output from the QT_QMAKE_SET macro much more
> human readable and additionally respect the QUIET flag.

Two remarks:

 1. Same question on $(QUIET) vs $(VERBOSE) as in patch 12/23

 2. You should probably use $(Q) instead of @ on the $(SED) lines so
    that the user doing "make V=1" will still get the real command lines

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
