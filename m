From: Sven Neumann <s.neumann@phase-zero.de>
Date: Sat, 17 Jan 2009 18:25:10 +0100
Subject: [Buildroot] Upgrading libgtk2 and libglibg2 to latest
	version	before the	release?
In-Reply-To: <8763ke4egh.fsf@macbook.be.48ers.dk>
References: <1232144162.6977.17.camel@aeglos.sweden.atmel.com>
	<8763ke4egh.fsf@macbook.be.48ers.dk>
Message-ID: <1232213110.20691.8.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, 2009-01-17 at 07:46 +0100, Peter Korsgaard wrote:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  Ulf> libgtk2 = 2.15.0
>  Ulf> libglib2 = 2.19.4
> 
> No, it's imho too risky. Let's do it right after the release and
> stabilize it for the the next (2009.05).

I have updated libglib2 to 2.18.4 (the latest stable release) and it
works nicely. There's a patch for this attached to bug 37. In my opinion
you should do this upgrade now as more and more libraries start to
depend on glib 2.18.


Sven
