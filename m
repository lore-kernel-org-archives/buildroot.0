From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Jun 2014 09:56:36 +0200
Subject: [Buildroot] [PATCH] binutils: arc: Fix native binutils build
	failure
In-Reply-To: <1402048584-19658-1-git-send-email-Anton.Kolesov@synopsys.com>
 (Anton Kolesov's message of "Fri, 6 Jun 2014 13:56:24 +0400")
References: <1402048584-19658-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <874mzxm9u3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anton" == Anton Kolesov <Anton.Kolesov@synopsys.com> writes:

 > ARC-specific Makefile has been ignoring DESTDIR when doing target "install".
 > This has been causing build failure for native binutils, since it was trying
 > to install into the host's "/usr". This commit adds a patch that teaches
 > Makefile to honor DESTDIR. This patch should be removed after ARC Binutils
 > will be bumped to next release.

 > This fixes:
 > http://autobuild.buildroot.net/results/68ee094509db3e8fbedf9bab5745ff68cdfe0a84/

 > Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
