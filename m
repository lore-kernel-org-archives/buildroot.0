From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 07:03:54 +0100
Subject: [Buildroot] [PATCH] qtopia4: reduce the use of
	BR2_PACKAGE_QTOPIA4
In-Reply-To: <200810250319.09175.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Sat\, 25 Oct 2008 03\:19\:08 +0200")
References: <200810250319.09175.markus.heidelberg@web.de>
Message-ID: <871vy399kl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> Use one conditional if statement instead of several single
 Markus> "depends on".

Thanks, committed as r23793.

-- 
Bye, Peter Korsgaard
