From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 12:38:17 +0200
Subject: [Buildroot] [PATCH] libplayer: Remove unsupported QUIET variable
In-Reply-To: <1369906037-5251-1-git-send-email-markos.chandras@gmail.com>
 (Markos Chandras's message of "Thu, 30 May 2013 10:27:17 +0100")
References: <1369906037-5251-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <87mwrc21nq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

 Markos> From: Markos Chandras <markos.chandras@imgtec.com>
 Markos> Fixes the following compilation problem when building with 'make -s'

 Markos> Unknown option "-q".
 Markos> See ./configure --help for available options.

This is probably a hint that it shouldn't be using autotools-package,
but OK - That can be fixed later.

Committed, thanks.

-- 
Bye, Peter Korsgaard
