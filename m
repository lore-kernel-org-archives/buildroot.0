From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 16:44:25 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707123642.GA15840@mx.loc> (Bernhard Fischer's message of
	"Mon\, 7 Jul 2008 14\:36\:42 +0200")
References: <20080704222950.E76B63C61F@busybox.net>
	<87fxqmg53j.fsf@macbook.be.48ers.dk> <48720878.3070602@atmel.com>
	<20080707123642.GA15840@mx.loc>
Message-ID: <87ej654uuu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard> On Mon, Jul 07, 2008 at 02:13:44PM +0200, Ulf Samuelsson wrote:
 >> -----BEGIN PGP SIGNED MESSAGE-----
 >> Hash: SHA1
 >> 
 >> Peter Korsgaard skrev:

 >>> That breaks the source-check/external-deps check in
 >>> Makefile.autotools.in (r22607).
 >>> 
 >> 
 >> Is not something like the following to be preferred?

 Bernhard> What were you trying to fix initially?

Me or Ulf? For me, see r22607. Makefile.autotools.in is kinda broken as
the download target is executed even if the download exists (E.G. it
uses a phony target instead of the exact file name), so source-check /
external-deps doesn't work like it does for the other packages.

-- 
Bye, Peter Korsgaard
