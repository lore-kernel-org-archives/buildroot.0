From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 16:55:49 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707134115.GF15840@mx.loc> (Bernhard Fischer's message of
	"Mon\, 7 Jul 2008 15\:41\:15 +0200")
References: <20080704222950.E76B63C61F@busybox.net>
	<873aml7ru0.fsf@macbook.be.48ers.dk> <48721947.9020804@atmel.com>
	<20080707134115.GF15840@mx.loc>
Message-ID: <87wsjx3fre.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> Yes, but that is really not a good implementation.
 >> The MAKELEVEL has really nothing to do with what you
 >> want to use it for, it just happens to work, but
 >> this implementation is easily broken.

 Bernhard> I have to agree to Ulf in this respect, fwiw.

Sure. The proper solution is to fix Makefile.autotools.in - But that's
not a 5min job.

An alternative solution would be to set DL_DIR to something invalid in
source-check/external-deps.

 Bernhard> Peter, why did you have to take MAKELEVEL into account?
 Bernhard> Perhaps we can fix this in a better way.. (pointing me to a
 Bernhard> detailed commit-message or to the ML archives is
 Bernhard> sufficient)

See my earlier mail and r22607.

-- 
Bye, Peter Korsgaard
