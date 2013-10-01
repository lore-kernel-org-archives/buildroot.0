From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Oct 2013 23:59:48 +0200
Subject: [Buildroot] [PATCH] glibc: Pass correct -mabi for MIPS
In-Reply-To: <1380121257-10449-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Wed, 25 Sep 2013 16:00:57 +0100")
References: <1380121257-10449-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <87txh0sld7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> According to glibc-2.18/ports/sysdeps/mips/preconfigure,
 Markos> if no -mabi was passed to CFLAGS, then it defaults to -mabi=n32.
 Markos> This breaks o32 and n64 builds for MIPS64. Therefore, it is
 Markos> necessary to append -mabi to CFLAGS.

 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
