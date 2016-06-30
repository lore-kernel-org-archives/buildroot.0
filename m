From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 30 Jun 2016 08:13:50 +0000
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
	arc-2016.09-eng005
In-Reply-To: <87lh1ng3df.fsf@dell.be.48ers.dk>
References: <1467217375-20555-1-git-send-email-abrodkin@synopsys.com>
 <87lh1ng3df.fsf@dell.be.48ers.dk>
Message-ID: <1467274364.26022.71.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2016-06-29 at 22:13 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> ?> With this commit we're starting a series of updates of ARC tools.
> ?> Significantly rewritten arc-2016.03 tools introduced way too many
> ?> problems highlighted by Buildroot autobuilder. Now in attempt to
> ?> resolve as many issues as possible by the time final release of
> ?> arc-2016.09 tools is cut we'll be executing arc-2016.09 series
> ?> with engineering snapshots like this one.
> 
> ?> We decided to go this way instead of applying separate patches here
> ?> and there because ongoing development introduces quite a lot of
> ?> changes and separate patches are not practical in Buildroot.
> 
> ?> Moreover this will give us very clean visibility of number of
> ?> issues we see (hopefully it will decrease over time).
> 
> ?> One of the important changes introduced in this engineering build
> ?> is initial set of changes for proper support of PIE on ARC in terms
> ?> of both building on host and running on ARC target. I expect some
> ?> PIE-related build breakages to go away and new ones will be treated
> ?> as the high-priority issues to be fixed ASAP.
> 
> ?> For now we only update Binutils and GCC while keeping GDB
> ?> as it is of arc-2016.03 release because there're some issues
> ?> we'd like to resolve before releasing it to wider audience.
> 
> ?> So again note this is one of the first engineering builds of
> ?> arc-2016.09 series and it might have all kinds of breakages,
> ?> please don't use it for production builds.
> 
> ?> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ?> Cc: arc-buildroot at synopsys.com
> ?> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ?> Cc: Peter Korsgaard <peter@korsgaard.com>
> 

Could you please rebuild toolchain for ARC with that commit?
https://git.busybox.net/buildroot/commit/?id=4520524ba055706236db9f00dd79f1b2e2e87fde

This will make use of arc-2016.09-eng005 toolchain drop in BR autobuilder.

-Alexey
