From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Sep 2008 13:31:23 +0200
Subject: [Buildroot] Login on a ttyS fails
In-Reply-To: <1221648506.30276.10.camel@chip.lis.inpg.fr> (=?utf-8?Q?=22St?=
	=?utf-8?Q?=C3=A9phane?= Mancini"'s message of "Wed\,
	17 Sep 2008 12\:48\:26 +0200")
References: <1221579108.7973.21.camel@chip.lis.inpg.fr>
	<873ak07x9m.fsf@macbook.be.48ers.dk>
	<1221648506.30276.10.camel@chip.lis.inpg.fr>
Message-ID: <874p4f2elw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "St?phane" == St?phane Mancini <stephane.mancini@grenoble-inp.fr> writes:

Hi,

 St?phane> Thanks Peter,
 St?phane> Yes, you're right the driver works correctly.

Good ;)

 St?phane> The behavior of busybox is very strange : the main of
 St?phane> appletlib.c sometime stops before doing anything. The
 St?phane> prompt I've inserted don't appear : they could be not
 St?phane> reached or never displayed ...  Is there a way to trace the
 St?phane> shell running ?

strace?

Do you still have problems logging in after updating to r23409 (and
rebuilding from scratch)?

 St?phane> Do you mind to send me a configuration file for a ML405
 St?phane> board that works ?

Sorry, I don't have access to a ML405. I've used systems with my
uartlite driver and buildroot without problems though.

-- 
Bye, Peter Korsgaard
