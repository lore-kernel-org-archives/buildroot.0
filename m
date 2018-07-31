From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 23:17:25 +0200
Subject: [Buildroot] Minicom git Repo and new version
In-Reply-To: <46fe66d9-b985-c338-2b84-376646793542@micronovasrl.com>
References: <46fe66d9-b985-c338-2b84-376646793542@micronovasrl.com>
Message-ID: <20180731231725.638cbe53@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Jul 2018 22:59:02 +0200, Giulio Benetti wrote:

> Adam(Minicom Maintainer) in Cc set up a repository for Minicom here:
> https://salsa.debian.org/minicom-team/minicom
> 
> Some fix and support s485 has been added since last package version.
> Most of all, now it's under git,
> so I wanted to ask if it would help if I create a patch managing Minicom 
> package as a git(possibly using github helper) and bumping version to 
> the last git commit.
> Or create new package based on git using same version as now.
> Or wait for Adam to tag a real version to do everything once.

Yes, you can send an update to use this new Git repository. It will of
course be even better when Adam does a tagged release, but in the mean
time, we can use a random Git commit especially if there's a good
justification behind it (RS485 support for example).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
