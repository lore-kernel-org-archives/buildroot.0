From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Nov 2013 12:20:07 +0100
Subject: [Buildroot] [PATCH] tvheadend: remove -Werror from CFLAGS
In-Reply-To: <1385721469-18112-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 29 Nov 2013 10:37:49 +0000")
References: <1385721469-18112-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87fvqfwj2w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Remove -Werror from CFLAGS to avoid build failures caused by warnings.
 > Fixes the following autobuild failure on MIPS64 n32/64:

 >    http://autobuild.buildroot.net/results/6be/6be075726ac6db0a48dd6b535841ada932c9ffbb/

 > Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

tvheadend should really use PRIu64 to print u46's, but ok - It shouldn't
use Werror either. Committed, thanks.

-- 
Bye, Peter Korsgaard
