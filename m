From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Jan 2009 17:24:52 +0100
Subject: [Buildroot] Upgrading libgtk2 and libglibg2 to latest
	versionbefore the	release?
In-Reply-To: <COL102-DS9509D5521155803397FFEDCD50@phx.gbl>
	(danieljlaird@hotmail.com's message of "Sat\,
	17 Jan 2009 08\:06\:22 -0000")
References: <1232144162.6977.17.camel@aeglos.sweden.atmel.com>
	<COL102-DS9509D5521155803397FFEDCD50@phx.gbl>
Message-ID: <87ocy53nor.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <danieljlaird@hotmail.com> writes:

 > I would rather not bounce gtk+ as 2.14.x and 2.15.x series have not yet 
 > fixed directfb support, maybe we could have a choice of versions until this 
 > is fixed.

Or simply leave it as it is for now. Do we have any concrete reason
for upgrading the gtk version? I'm using gtk 2.12 on my Debian machine
as well. The bug tracker issue was for glib, and there's afaik no
issues with using a newer glib version with gtk 2.12 (I'm having 2.16
here).

Adding a configuration option would mean we would mean a lot more
configurations to test, so I would prefer to not to that.

-- 
Bye, Peter Korsgaard
