From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Oct 2014 22:15:05 +0200
Subject: [Buildroot] [PATCH] ser2net: Fix compilation failures due to
	missing TIOCSRS485 macro
In-Reply-To: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 7 Oct 2014 15:30:49 +0100")
References: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87y4srfxh2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Apply a patch sent upstream to fix a compilation failure present on some
 > architectures which do not define the TIOCSRS485 macro and do not
 > include the <asm-generic/ioctls.h> header. This is how the error looks
 > like:

 > devcfg.c:781:34: error: 'TIOCSRS485' undeclared (first use in this
 > function)

 > Patch sent upstream:
 > 	https://sourceforge.net/p/ser2net/mailman/message/32905302/

 > Fixes:
 > 	http://autobuild.buildroot.net/results/5376a3f64c95f14449b956df006741ffeca1350b/
 > 	http://autobuild.buildroot.net/results/d182d94562a549c79c0c9fb01777a7cb83d7ab4c/
 > 	http://autobuild.buildroot.net/results/478c5ad2f5541adef4218ad485aab4d78cf29210/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
