From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Jun 2013 22:24:39 +0200
Subject: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36
In-Reply-To: <1371326730.31593.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 (piquemal michel's message of "Sat, 15 Jun 2013 21:05:30 +0100 (BST)")
References: <1371326730.31593.YahooMailNeo@web171503.mail.ir2.yahoo.com>
Message-ID: <87bo77yveg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "piquemal" == piquemal michel <michel_piquemal@yahoo.fr> writes:

 piquemal> Hi,

 piquemal> I'm trying to build a matching dev environment for a MIPSel
 piquemal> embedded product that I bought.  It's based uClibc 0.9.28,
 piquemal> Linux 2.6.36, I know...pretty old stuff.

Argh, indeed.

 piquemal> I started off latest 05-13 buildroot menuconfig, setting up
 piquemal> target HW, linux version.  While I could not select
 piquemal> appropriate uClibC version I left default, but made some
 piquemal> minor change in uclib.mk to reflect proper version and
 piquemal> download location.

I wouldn't try to combine such an only uClibc version with anything
recent, as recent programs often need features not available in older
uClibc versions.

Looking back in the git history, we removed uClibc 0.9.28 support in the
2010.08 cycle, so I think the 2010.05 release is your best bet.

-- 
Bye, Peter Korsgaard
