From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 14 Oct 2013 11:38:14 +0200 (CEST)
Subject: [Buildroot] Bumping packages: some comments/suggestions
In-Reply-To: <20131014113000.73ca82bf@skate>
Message-ID: <1642454622.8785613.1381743494806.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> I must say I'm not a big fan of the automatic build, which may
> encourage people to do "careless" bump, i.e version bumps without
> looking at least a little bit at what changed, and taking a set back
> by
> looking at the version number, or the project web site, to see if the
> version bump is small, or major.
> 

yeah, that's the "might not be a good idea" part... I was more thinking
on the line of "this is a minor release and it compiles correctly, it's
probably an easy job to test and bump" i.e for the case of minor/security
releases upstream. It's a balance between helping maintainers work fast,
helping project managers see low hanging fruites and making sure people
are not too lazy...

> For the second one, I agree. We have discussed a few times having the
> notion of package maintainers. Probably something that will be worth
> discussing at this time.
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
