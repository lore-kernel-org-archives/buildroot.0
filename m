From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jul 2014 15:11:21 +0200
Subject: [Buildroot] [PATCH] pinentry: Some toolchains need -pthread in
	the linker command line
In-Reply-To: <1403000593-31387-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 17 Jun 2014 11:23:13 +0100")
References: <1403000593-31387-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87bnt56zgm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Some toolchains, like Sourcery Codebench 2013.05, need -pthread to be
 > added to the linker command line when linking pinentry-qt.

 > Fixes:
 >    http://autobuild.buildroot.net/results/6be/6be109ccedec603a67cebdb31b55865dcce0e128/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
