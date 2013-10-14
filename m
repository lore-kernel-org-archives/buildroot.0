From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Mon, 14 Oct 2013 08:45:18 -0500
Subject: [Buildroot] Bumping packages: some comments/suggestions
In-Reply-To: <20131014113000.73ca82bf@skate>
References: <20131014090904.1f20fcf4@skate>
 <1959407319.8772723.1381736446742.JavaMail.root@openwide.fr>
 <20131014113000.73ca82bf@skate>
Message-ID: <OF429160ED.AF03B337-ON86257C04.004B70CD-86257C04.004B8F4A@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas P, Jeremy R, All,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 
10/14/2013 04:30:00 AM:

> Dear Jeremy Rosen,
> 
> On Mon, 14 Oct 2013 09:40:46 +0200 (CEST), Jeremy Rosen wrote:
> 
> > two ideas that might or might not be good ideas but are worth 
discussing
> > early :
> > 
> > * try to automatically build the new version to see if it is an "easy
> > bump" or a "hard bump" and document the result
> > 
> > * ping the last person(s) that touch the package (git has facilities 
to
> > find them, I think it's called git-contribute) when a new version is
> > available
> > 
> > both have good and bad sides, thus worth discussing...
> 
> Agreed. But all of this first requires the ability to detect that a new
> version is available.
> 
> I must say I'm not a big fan of the automatic build, which may
> encourage people to do "careless" bump, i.e version bumps without
> looking at least a little bit at what changed, and taking a set back by
> looking at the version number, or the project web site, to see if the
> version bump is small, or major.
> 
> For the second one, I agree. We have discussed a few times having the
> notion of package maintainers. Probably something that will be worth
> discussing at this time.

Sounds like a good topic for the Buildroot Developer Days...

Thanks,
-Ryan
