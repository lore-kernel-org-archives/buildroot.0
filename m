From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Sep 2009 14:44:02 +0200
Subject: [Buildroot] OpenSSL fails to build with AVR32
In-Reply-To: <4ABA040E.1000907@mimc.co.uk> (Mark Jackson's message of "Wed\,
	23 Sep 2009 12\:18\:38 +0100")
References: <4ABA040E.1000907@mimc.co.uk>
Message-ID: <87ab0lrfu5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Jackson <mpfj-list@mimc.co.uk> writes:

 Mark> With the latest git, openssl fails to build (see below).
 Mark> Any ideas ?

Yes, avr32 support doesn't seem to have been merged into openssl
mainline, and the avr32 patch has been dropped some time ago. I'll fix
it so avr32 uses the generic (unoptimized) code.

-- 
Bye, Peter Korsgaard
