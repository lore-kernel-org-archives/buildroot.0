From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 20:10:37 +0100
Subject: [Buildroot] Buildroot 2009.02 released
In-Reply-To: <1983108078.3421235065282329.JavaMail.root@zimbra-store.cetrtapot.si>
	("Hinko =?utf-8?Q?Ko=C4=8Devar=22's?= message of "Thu\, 19 Feb 2009
	18\:41\:22 +0100 \(CET\)")
References: <1983108078.3421235065282329.JavaMail.root@zimbra-store.cetrtapot.si>
Message-ID: <87prhe8cpe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hinko" == Hinko Ko?evar <hinko.kocevar@cetrtapot.si> writes:

Hi,

 Hinko> I'll try to steal some time to try out basic packages (for
 Hinko> starters) that build & run on cris-v10 arch. That's the only
 Hinko> embedded arch I can test.

Good, I don't believe we have many others testing cris.

 Hinko> What about he packages that can not be built for some specific
 Hinko> arch, for some reason or another (too few resources CPU, mem,
 Hinko> flash, ..)? Should they be marked or noted somehow to inform
 Hinko> us about its status on selected arch?

Well, lets differenciate between stuff that doesn't build for a given
arch, and things that don't make sense to run (E.G. no graphical
output, no sound, lack of RAM, ..). The first thing I think we should
either hide or mark as broken in Kconfig, but the 2nd very much
depends on your specific board.

-- 
Bye, Peter Korsgaard
