From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Mar 2020 09:06:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to v12.16.1
In-Reply-To: <8736apcbok.fsf@dell.be.48ers.dk>
References: <20200303191133.10404-1-aduskett@gmail.com>
 <20200303224315.2237b29c@windsurf.home>
 <8736apcbok.fsf@dell.be.48ers.dk>
Message-ID: <20200304090618.3438b127@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 03 Mar 2020 23:31:55 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  >> Fixes:
>  >> http://autobuild.buildroot.net/results/9d3545a76c4f5c06debf319687498d662a53fafb
>  >> http://autobuild.buildroot.net/results/4da6c695b8ceca0a6eee2481a1b873a46676d0f5  
> 
>  > Are you positive that this bump fixes the ICU issues? I.e did you
>  > reproduce the ICU issues before this version bump, and confirm they
>  > disappeared solely because of the version bump?  
> 
> It sounds unlikely, given the very few commits between 12.16.0 and
> 12.16.1, and nothing mentioned in the changelog about icu:
> 
> https://github.com/nodejs/node/blob/master/doc/changelogs/CHANGELOG_V12.md#12.16.1

Right, so I'm quite doubtful about the "Fixes" tag. I suppose Adam did
not reproduce the issue after the bump, but also did not have the issue
before the bump.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
