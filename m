From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 09:46:27 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc: add a missing function member
	to siginfo.h
In-Reply-To: <1389202364-19387-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 8 Jan 2014 17:32:43 +0000")
References: <1389202364-19387-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87fvet3f3g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Applying an upstream patch to add a missing function member on ia64,
 > mips and sparc arches.

 > Upstream patch URL:
 >    http://git.uclibc.org/uClibc/commit/libc/sysdeps/linux?id=b4e6e61e2f7c6fb4bf59f66efaa74591a2112912

 > Fixes:
 >    http://autobuild.buildroot.net/results/fa0/fa03ecc087a4b30df8b0366bb238be3d167a56d9/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed after the discussion at the dev days, thanks.

-- 
Bye, Peter Korsgaard
