From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Nov 2010 22:24:58 +0100
Subject: [Buildroot] [PATCH] do not strip libthread_db.so
In-Reply-To: <1290248968-16122-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Sat, 20 Nov 2010 05:29:28 -0500")
References: <1290248968-16122-1-git-send-email-vapier@gentoo.org>
Message-ID: <87ipzm4dp1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> For proper threading debug support, the libthread_db.so library cannot
 Mike> be stripped on the target.  This is because the target gdbserver will
 Mike> also load up this library at runtime and poke around its symbols.

Committed, thanks

-- 
Bye, Peter Korsgaard
