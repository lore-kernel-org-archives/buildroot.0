From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Oct 2013 10:58:08 +0200
Subject: [Buildroot] [PATCH] dropwatch: Remove -Werror from CFLAGS
In-Reply-To: <1381998805-6732-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Thu, 17 Oct 2013 09:33:25 +0100")
References: <1381998805-6732-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <87fvrtel7j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 > -Werror shouldn't be used in released code since it can
 > cause random build failures on moderate warnings. It also
 > depends on the used toolchain since different toolchains may
 > or may not print the same warnings.

 > Fixes the following build problem on MIPS64/n64:

Committed, thanks.

-- 
Bye, Peter Korsgaard
