From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 16:33:40 +0100
Subject: [Buildroot] [PATCH] webkit: disable on powerpc
In-Reply-To: <b82a6eacae7968135320.1393165932@argentina> (Thomas De
 Schampheleire's message of "Sun, 23 Feb 2014 15:32:12 +0100")
References: <b82a6eacae7968135320.1393165932@argentina>
Message-ID: <87ppmdq1wr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > webkit does not build correctly on powerpc. There is an upstream bug report
 > with a partial fix, but with remaining problems.
 > https://bugs.webkit.org/show_bug.cgi?id=113638

 > Until this problem is fixed, we disable webkit on powerpc.

 > Fixes
 > http://autobuild.buildroot.org/results/3ce/3ce992a663ddf1030a987bb778f8275a8e5fdef0/

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

What about the webkit copies in qt4/5? Do they work on powerpc?

-- 
Bye, Peter Korsgaard
