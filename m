From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2014 22:44:34 +0200
Subject: [Buildroot] [PATCH] luajit: Disable for MIPS architecture with
	soft-float
In-Reply-To: <1397050855-5843-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 9 Apr 2014 14:40:55 +0100")
References: <1397050855-5843-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <8738hk7w3x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Currently luajit is not supported on MIPS soft-float userlands. Upstream
 > plans to support it in the future:

 >    http://wiki.luajit.org/Open-Sponsorships#MIPS-Soft-Float-and-Dual-Number-Port

 > Fixes:

 >    http://autobuild.buildroot.net/results/d52/d5232a215e9e9aeb40b2e4e353329a27603c79ab/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
