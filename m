From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Mar 2009 23:25:15 +0100
Subject: [Buildroot] linux kernel configuration for lex CV860A (VIA C3)
	Motherboard
In-Reply-To: <49A97CDF.1070402@unix-beratung.de> (Robert Urban's message of
	"Sat\, 28 Feb 2009 19\:05\:19 +0100")
References: <49A97CDF.1070402@unix-beratung.de>
Message-ID: <874oyai6r8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Urban <urban@unix-beratung.de> writes:

 Robert> Hi Folks,
 Robert> I looking for a kernel configuration for a recent kernel tailored to this
 Robert> motherboard.  Has anyone already done this?  Is there some database
 Robert> somewhere where such things can be sought?

Not afaik, and the configuration would very much depend on what you
want to do with it. I would suggest you start with a minimal config
and compile, test, add stuff until everything you need works.

-- 
Bye, Peter Korsgaard
