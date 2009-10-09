From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 14:47:15 +0200
Subject: [Buildroot] [PATCH 11/23] qt: remove unnecessary call to qstrip
	macro in Makefile
In-Reply-To: <1254907246-5650-12-git-send-email-mroth@nessie.de> (Michael
	Roth's message of "Wed\, 7 Oct 2009 11\:20\:34 +0200")
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-12-git-send-email-mroth@nessie.de>
Message-ID: <873a5sg2ek.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

 Michael> QT_CONFIGURE can never gain double quotes, so there
 Michael> is no point to remove some.

Committed, thanks.

-- 
Bye, Peter Korsgaard
