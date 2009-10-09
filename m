From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 14:35:53 +0200
Subject: [Buildroot] [PATCH 03/23] qt: enable proper re-configure
In-Reply-To: <1254907246-5650-4-git-send-email-mroth@nessie.de> (Michael
	Roth's message of "Wed\, 7 Oct 2009 11\:20\:26 +0200")
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-4-git-send-email-mroth@nessie.de>
Message-ID: <87tyy8g2xi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

 Michael> The Qt configure script doesn't use config.cache but the
 Michael> generated Makefile provides a confclean target to properly
 Michael> clean out old configuration.

Committed, thanks.

-- 
Bye, Peter Korsgaard
