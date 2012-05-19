From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 May 2012 23:27:26 +0200
Subject: [Buildroot] [PATCH] gpsd: Remove package version from the
	navcom patch
In-Reply-To: <1336731854-5526-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Fri, 11 May 2012 11:24:14 +0100")
References: <1336731854-5526-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <87obpjlv41.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> If the buildroot infrastructure finds a patch file that contains the
 Markos> $PKG-$VERSION tuple in the filename, it will only apply this kind of
 Markos> patches, ignoring the rest of the patches in the package directory.
 Markos> As a result of which, the gpsd-fix-libgpsmm.patch did not apply
 Markos> because the gpsd-2.95-navcom.patch satisfies the $PKG-$VERSION convention.
 Markos> The buildroot policy (as discussed during the Buildroot Developer meeting)
 Markos> is to remove the package version from the patch filename.

Committed, thanks.

-- 
Bye, Peter Korsgaard
