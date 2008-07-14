From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jul 2008 21:12:02 +0200
Subject: [Buildroot] Stable release?
In-Reply-To: <20080714181515.GA7760@cbg.dyndns.org> (Steffen Schulz's message
	of "Mon\, 14 Jul 2008 20\:15\:15 +0200")
References: <20080714181515.GA7760@cbg.dyndns.org>
Message-ID: <878ww48em5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steffen" == Steffen Schulz <pepe_ml@gmx.net> writes:

 Steffen> Hi all,

 Steffen> First of all many thanks to the developers of buildroot and
 Steffen> stuff like uclibc and busybox. You're doing great work!

Thanks.

 Steffen> I found buildroot to be the optimal solution for the system
 Steffen> engineering I do at work. Other distros are less flexible,
 Steffen> outdated or more difficult to modify. I'd also love to use
 Steffen> buildroot on my OLPC, ideally with the gentoo portage
 Steffen> package to add more programs later on.


 Steffen> So my question is, will there ever be a 'stable' release of
 Steffen> buildroot?  Do you aim for a system where all packages tend
 Steffen> to compile smoothly or do you continue to add new software
 Steffen> versions as long as some of the stuff builds?

I sure hope so! There has been discussions about it on and off, but we
have quite limited man power, so I hasn't happened yet. I'm setting up
a regression testing system (with buildbot) which will hopefully help
us getting there. Preferably we should have time based releases
(E.G. something like every 6 months).

-- 
Bye, Peter Korsgaard
