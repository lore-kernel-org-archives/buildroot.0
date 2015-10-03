From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 23:16:50 +0200
Subject: [Buildroot] [PATCH] gdb: do not build documentation for bfd and
	gprof
In-Reply-To: <1443705837-23322-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 1 Oct 2015 14:23:57 +0100")
References: <1443705837-23322-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <8737xr1wl9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Our previous patch to disable the documentation in gdb wasn't complete.
 > There are cases where the documentation under bfd and gprof directories
 > is being built, causing the subsequent failure due to missing makeinfo.
 > This patch fixes that problem.

 > Fixes:

 >   http://autobuild.buildroot.org/results/244/2442e697d8a300496434fd42fcb1ee3941d13e06/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
