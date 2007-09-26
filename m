From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Sep 2007 13:48:44 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <1190806225.4933.38.camel@elrond.atmel.sweden> (Ulf Samuelsson's
	message of "Wed\, 26 Sep 2007 13\:30\:25 +0200")
References: <20070926102333.E52393004A@busybox.net>
	<87d4w5n0rt.fsf@macbook.be.48ers.dk>
	<1190806225.4933.38.camel@elrond.atmel.sweden>
Message-ID: <87y7etlk9v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf@atmel.com> writes:

 >> Huh, on the build host? Why would qtopia mess around with that?

 Ulf> It includes <dbus/dbus.h>
 Ulf> Which on OpenSuSE 10.2 is at <dbus-1.0/dbus/dbus.h>

But it's compiled with the cross compiler right? Or is this some kind
of host build tool?

/me is confused.

-- 
Bye, Peter Korsgaard
