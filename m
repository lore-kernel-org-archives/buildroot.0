From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 07:01:56 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/popt
In-Reply-To: <1232926121.2298.52.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Mon\, 26 Jan 2009 00\:28\:41 +0100")
References: <20090125205100.1BBE176D28@busybox.osuosl.org>
	<87ljszdrqv.fsf@macbook.be.48ers.dk>
	<1232926121.2298.52.camel@elrond.atmel.com>
Message-ID: <87k58id2qz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> What's wrong with := ?

 Ulf> 90%+ of the Autotools packages use "=" and the rest use ":="
 Ulf> when I did a quick grep

 Ulf> Feel free to argue pro/con.

They are basic variables. We normally use := where possible for
performance reasons and to not have surprises later, but I know the
Makefile.autotoos.in "style" is = instead.

Just leave it for now, but please stick "cleanups" in seperate commits
from funcional changes.

-- 
Bye, Peter Korsgaard
