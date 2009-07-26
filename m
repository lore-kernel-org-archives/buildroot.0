From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Jul 2009 22:34:45 +0200
Subject: [Buildroot] Write Access to buildroot?
In-Reply-To: <4A6CBAAC.2060309@atmel.com> (Ulf Samuelsson's message of "Sun\,
	26 Jul 2009 22\:21\:00 +0200")
References: <4A689265.6030308@atmel.com> <87skgmwm6h.fsf@macbook.be.48ers.dk>
	<4A69741A.8010903@atmel.com>
	<20090724085603.GL13236@buzzloop.caiaq.de>
	<9E543F22BF68405185D6B77291E4E5EF@aeglos>
	<20090724121641.2c4cf8bd@surf> <4A699CDD.7060703@atmel.com>
	<20090724152448.4d1f5934@surf> <4A69D04E.9040408@atmel.com>
	<20090724224516.15b39e30@surf> <4A6BEE7C.4080308@atmel.com>
	<87r5w3syn7.fsf@macbook.be.48ers.dk> <4A6C242F.8040704@atmel.com>
	<878wibslsk.fsf@macbook.be.48ers.dk> <4A6CBAAC.2060309@atmel.com>
Message-ID: <87vdlfqj2y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> I have requested a capability where multiple people have
 Ulf> write capability to a tree which can then be pulled
 Ulf> to the official tree.

 Ulf> It is possible to do this on another git server,
 Ulf> but that means that it is less visible to other Buildroot users.

 Ulf> It is simple to implement.
 Ulf> Create the "common" user, and let developers have
 Ulf> write access to "~common/git", possibly using a symbolic link.

Then do so. You have shell access to the buildroot.net machine, so you
can make ~ulf/git/common world writable.

-- 
Bye, Peter Korsgaard
