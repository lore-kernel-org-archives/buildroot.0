From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 11:42:36 +0200
Subject: [Buildroot] [PATCH 05/23] qt: remove Makefile variable QT_QMAKE
In-Reply-To: <1254907246-5650-6-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-6-git-send-email-mroth@nessie.de>
Message-ID: <20091007114236.0671ae1a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:28 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> The variable is no longer referenced by any buildroot code and not
> needed by external programs.

Well, it *might* be useful for people willing to add their own Qt
applications, using the qmake build system, into the Buildroot
infrastructure.

But unless this is documented somewhere, this is useless. So we should
either:

 * Remove it

 * Keep it, but document it somwhere. See my suggestions associated to
   patch 02/23 for details

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
