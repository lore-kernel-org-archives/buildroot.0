From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Jan 2009 18:49:26 +0100
Subject: [Buildroot] Upgrading libgtk2 and libglibg2 to latest version
	before the	release?
In-Reply-To: <1232213110.20691.8.camel@bender> (Sven Neumann's message of
	"Sat\, 17 Jan 2009 18\:25\:10 +0100")
References: <1232144162.6977.17.camel@aeglos.sweden.atmel.com>
	<8763ke4egh.fsf@macbook.be.48ers.dk> <1232213110.20691.8.camel@bender>
Message-ID: <87bpu53jrt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:

 >> No, it's imho too risky. Let's do it right after the release and
 >> stabilize it for the the next (2009.05).

 Sven> I have updated libglib2 to 2.18.4 (the latest stable release)
 Sven> and it works nicely. There's a patch for this attached to bug
 Sven> 37. In my opinion you should do this upgrade now as more and
 Sven> more libraries start to depend on glib 2.18.

Ok, I'll apply the patch once 2009.02 is released (3 weeks).

-- 
Bye, Peter Korsgaard
