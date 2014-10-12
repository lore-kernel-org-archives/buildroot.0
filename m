From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 09:47:07 +0200
Subject: [Buildroot] [PATCH] rt-tests: enable on MIPS uClibc again
In-Reply-To: <1413040612-19235-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 11 Oct 2014 17:16:52 +0200")
References: <1389202364-19387-1-git-send-email-Vincent.Riera@imgtec.com>
 <1413040612-19235-1-git-send-email-arnout@mind.be>
Message-ID: <877g053f2c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > We have fixes in the internal toolchain; an external toolchain is most
 > likely a buildroot-built toolchain anyway, so it will also have the
 > fix. But we still keep a comment to warn the user for potentially-broken
 > external toolchains.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
