From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Apr 2014 10:58:05 +0200
Subject: [Buildroot] [PATCH] evemu: use sysroot provided input.h file
	(instead of host system version)
In-Reply-To: <1398460136-18217-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Fri, 25 Apr 2014 23:08:56 +0200")
References: <1398460136-18217-1-git-send-email-ps.report@gmx.net>
Message-ID: <87iopwzcv6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add patch for src/make-event-names.py to use sysroot provided input.h
 > instead of hard coded '/usr/include/linux/input.h' (host system version)
 > one.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
