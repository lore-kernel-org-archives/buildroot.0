From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Nov 2013 09:04:25 +0100
Subject: [Buildroot] [PATCH] libiscsi: Call autoreconf to use
	buildroot's libtool
In-Reply-To: <1384784622-45380-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 18 Nov 2013 14:23:42 +0000")
References: <1384784622-45380-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87txeuuxh2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Use updated libtool from buildroot to fix MIPS64/n64 build problems
 > http://autobuild.humanoidz.org/results/a9a/a9aa506a591581e413dc38c53d0e56bec5970634/build-end.log

 > Acked-by: Markos Chandras <markos.chandras@imgtec.com>
 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed with a comment added explaining why we're autoreconfig,
thanks.

-- 
Bye, Peter Korsgaard
