From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Jan 2014 22:41:46 +0100
Subject: [Buildroot] [PATCH] aiccu: fix undefined reference to clock_*
	functions
In-Reply-To: <1389698547-27787-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 14 Jan 2014 11:22:27 +0000")
References: <1389698547-27787-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <877ga2xmud.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Since glibc 2.17 the clock_* suite functions are available directly in
 > the main C library. For previous versions we still need -lrt to link.

 > Upstream is aware of this problem.

 > Fixes:
 >    http://autobuild.buildroot.net/results/c11/c1182b00f9d968e587acba15af4af905b92227f5/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
