From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 20:43:47 +0100
Subject: [Buildroot] 2009.02-rc4 released
In-Reply-To: <4991B91A.4060208@sdgsystems.com> (Aric D. Blumer's message of
	"Tue\, 10 Feb 2009 12\:27\:54 -0500")
References: <87ljsf7f2f.fsf@macbook.be.48ers.dk>
	<4991B91A.4060208@sdgsystems.com>
Message-ID: <87wsby3wng.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Aric" == Aric D Blumer <aric@sdgsystems.com> writes:

 Aric> Peter Korsgaard wrote:
 >> . . .
 >> 
 >> Please give it a spin and report back issues to the mailing list or
 >> the bug tracker.
 >> 

 Aric> I'm having a strange dependency problem with rc4 where it reinstalls
 Aric> gmp-4.2.2-host and recompiles mpfr-2.3.2-host every time I run make. 
 Aric> Condensed transcript below.

Yes, sorry about that. The mpfr/gmp stuff was changed between rc3 and
rc4 because the build was breaking on machines without mpfr/gmp shared
objects (like Ubuntu) - Unfortunately some things were missing so you
would have continous rebuilds.

It should all be fixed in svn now, could you give that a try (atleast
r25295)?

-- 
Bye, Peter Korsgaard
