From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Aug 2013 14:10:26 +0200
Subject: [Buildroot] [PATCH] ltrace: Add missing mips->mipsel symlink
In-Reply-To: <1377857843-7453-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Fri, 30 Aug 2013 11:17:23 +0100")
References: <1377857843-7453-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <87ppsve5vx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> Restore missing mips->mipsel symlink. It appears ltrace was
 Markos> packaged incorrectly and the symlink got lost. See
 Markos> http://lists.alioth.debian.org/pipermail/ltrace-devel/2013-August/000938.html

Committed with a small comment explaing why, thanks.

-- 
Bye, Peter Korsgaard
