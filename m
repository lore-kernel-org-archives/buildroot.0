From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Dec 2012 07:48:35 -0800
Subject: [Buildroot] [PATCH] qtuio: fix build issue because of missing
	include
In-Reply-To: <1354452949-13691-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Sun, 2 Dec 2012 13:55:49 +0100")
References: <1354452949-13691-1-git-send-email-sho@relinux.de>
Message-ID: <877gp078vg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> TuioServer.cpp uses usleep but did not include <unistd.h>. This
 Stephan> patch adds the missing #include. This issue has been reported
 Stephan> upstream.

Committed, thanks.

-- 
Bye, Peter Korsgaard
