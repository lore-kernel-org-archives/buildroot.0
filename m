From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Jun 2013 20:52:00 +0200
Subject: [Buildroot] [PATCH] openswan: Restore -fPIE to USERCOMPILE flags
In-Reply-To: <1372173276-13616-1-git-send-email-markos.chandras@gmail.com>
 (Markos Chandras's message of "Tue, 25 Jun 2013 16:14:36 +0100")
References: <1372173276-13616-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <87wqpf1j5b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

 Markos> From: Markos Chandras <markos.chandras@imgtec.com>
 Markos> The default USERCOMPILE variable uses -fPIE so we bring this back.
 Markos> This also fixes linking problems for MIPS when non-PIC objects
 Markos> are used to form a PIC one.

 Markos> Fixes the following linking problem on MIPS:
 Markos> connections.o: relocation R_MIPS_HI16 against `__gnu_local_gp'
 Markos> can not be used when making a shared object; recompile with -fPIC

Committed, thanks.

-- 
Bye, Peter Korsgaard
