From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 22:07:49 +0200
Subject: [Buildroot] [PATCH] setools: fix race condition
In-Reply-To: <1441900705-40009-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 10 Sep 2015 16:58:25 +0100")
References: <1441900705-40009-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87k2ryf36y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > As reported upstream:
 >   https://github.com/TresysTechnology/setools3/issues/5

 > setools tries to compile a .c file before being generated and then it
 > produces an error like this one:

 > error: policy_scan.c: No such file or directory

 > Until upstream fixes the problem we can workaround this by using MAKE1
 > as the SETOOLS_MAKE.

 > Fixes:

 >   http://autobuild.buildroot.net/results/119/1196ac448c77320b59b63b6133d2d1af1245bf69/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
