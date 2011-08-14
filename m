From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Aug 2011 10:04:56 +0200
Subject: [Buildroot] [PATCH] libxml-parser-perl: fix install bug
In-Reply-To: <20110812191428.101290@gmx.net> (Heiko Helmle's message of "Fri, 
 12 Aug 2011 21:14:28 +0200")
References: <20110812191428.101290@gmx.net>
Message-ID: <87hb5kh107.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Helmle <helman@gmx.net> writes:

 Heiko> Hello List,
 Heiko> This patch makes libxml-parser-perl behave on my system - though it looks like it isn't necessary on all host OSses (on gentoo and opensuse it works without, but on ubuntu lucid and Scientific 6 it fails without the patch).

Committed, thanks. Your (web) mailer had screwed up whitespace in the
patch though, so I had to make the change manually.

Please consider using git send-email in the future.

-- 
Bye, Peter Korsgaard
