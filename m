From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 22:14:52 +0100
Subject: [Buildroot] legacy sources in svn
In-Reply-To: <1206738394.3224.82.camel@nigel-x60> (Nigel Kukard's message of
	"Fri\, 28 Mar 2008 21\:06\:34 +0000")
References: <1206738394.3224.82.camel@nigel-x60>
Message-ID: <87k5jmft4j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

 Nigel> Is there a reason for example that there are removed gcc
 Nigel> versions still in toolchain/gcc/x.y.z ?

 Nigel> Are they kept there incase someone needs to build an older version?

I think people simply forget to remove them when they remove the
Kconfig stuff - I have lately been cleaning up the uClibc patches that
weren't used any more.

 Nigel> Surely they can get the old patches from svn? I mean, the
 Nigel> versions are mostly removed from all Config.in and .mk files
 Nigel> anyway?

Exactly, feel free to remove them.

-- 
Bye, Peter Korsgaard
