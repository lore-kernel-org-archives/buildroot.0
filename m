From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 07:17:22 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: argus bind
	dmraid kismet libeXosip2 ltra etc...
In-Reply-To: <20090126003405.2EE7776D28@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Mon\, 26 Jan 2009 00\:34\:04 +0000 \(UTC\)")
References: <20090126003405.2EE7776D28@busybox.osuosl.org>
Message-ID: <873af6d219.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-26 00:34:02 +0000 (Mon, 26 Jan 2009)
 ulf> New Revision: 25041

 ulf> Log:
 ulf> Add help for packages without AVR32 support

Do they all really NEED avr32 patches to build? Some of them atleast
doesn't seem to be very hardware specific. Do they all fail doing
build for avr32? Can you post snippets of the build logs?

-- 
Bye, Peter Korsgaard
