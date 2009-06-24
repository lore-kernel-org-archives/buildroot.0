From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Jun 2009 16:44:32 +0200
Subject: [Buildroot] How to get symbolic debugging to work?
In-Reply-To: <1245830343.3872.9.camel@sven> (Sven Neumann's message of "Wed\,
	24 Jun 2009 09\:59\:03 +0200")
References: <h1p5br$11r$1@ger.gmane.org> <h1r69p$kd5$1@ger.gmane.org>
	<1245830343.3872.9.camel@sven>
Message-ID: <871vp94rov.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> We also have problems with gdb 6.8 on the ARM. Or in other
 Sven> words, it just plain does not work. I will now follow your
 Sven> advice and switch to version 6.7.1. If that actually helps,
 Sven> then buildroot should probably select that version when
 Sven> building for an ARM target (similar as what is done currently
 Sven> for AVR32).

Or fix 6.8. I'll take a look at the fedora patches the coming weekend.

-- 
Bye, Peter Korsgaard
