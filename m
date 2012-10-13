From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Oct 2012 22:25:24 +0200
Subject: [Buildroot] [PATCH] package infra: remove empty TARGET_CPPFLAGS
	def
In-Reply-To: <1350128018-3195-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 13 Oct 2012 08:33:38 -0300")
References: <1350128018-3195-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87obk615mz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> It's unneeded, just fills the next match (LARGEFILE) with a leading
 Gustavo> space. Fixes
 Gustavo> http://autobuild.buildroot.net/results/ad5772d19036a0c5564228ac7aba953d35a3cf85/build-end.log
 Gustavo> since SCons can't handle leading whitespace in LDFLAGS gracefully.

Committed, thanks.

-- 
Bye, Peter Korsgaard
