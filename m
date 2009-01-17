From: Sven Neumann <s.neumann@phase-zero.de>
Date: Sat, 17 Jan 2009 18:29:51 +0100
Subject: [Buildroot] Upgrading libgtk2 and libglibg2 to
	latest	versionbefore the	release?
In-Reply-To: <87ocy53nor.fsf@macbook.be.48ers.dk>
References: <1232144162.6977.17.camel@aeglos.sweden.atmel.com>
	<COL102-DS9509D5521155803397FFEDCD50@phx.gbl>
	<87ocy53nor.fsf@macbook.be.48ers.dk>
Message-ID: <1232213391.20691.13.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, 2009-01-17 at 17:24 +0100, Peter Korsgaard wrote:

> Or simply leave it as it is for now. Do we have any concrete reason
> for upgrading the gtk version? I'm using gtk 2.12 on my Debian machine
> as well. The bug tracker issue was for glib, and there's afaik no
> issues with using a newer glib version with gtk 2.12 (I'm having 2.16
> here).

I have been running gtk+ 2.12 together with glib 2.18 for several months
on my desktop machine. glib 2.18 is fully backward compatible with
earlier glib 2.x releases and afaik there are no known
incompatibilities. As I am also following the gtk-devel list, I would
probably know if there were any.


Sven
