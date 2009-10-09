From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 14:42:56 +0200
Subject: [Buildroot] [PATCH 10/23] qt: don't enable internal
	tslib-module debugging
In-Reply-To: <1254907246-5650-11-git-send-email-mroth@nessie.de> (Michael
	Roth's message of "Wed\, 7 Oct 2009 11\:20\:33 +0200")
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-11-git-send-email-mroth@nessie.de>
Message-ID: <877hv4g2lr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

 Michael> In Qt there are virtually hundreds of internal debug flags like
 Michael> TSLIBMOUSEHANDLER_DEBUG for every module or even C++ class. There
 Michael> is no reason to enable a single such flag when Qt is build with
 Michael> debugging symbols and others not.

Committed, thanks.

-- 
Bye, Peter Korsgaard
