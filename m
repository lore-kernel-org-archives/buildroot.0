From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 17 Oct 2019 13:26:25 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH] toolchain: Bump ARC tools
 to arc-2019.09-eng002
In-Reply-To: <20191016214447.20468d93@windsurf.home>
References: <20191015090258.46280-1-Evgeniy.Didin@synopsys.com>
 <20191016214447.20468d93@windsurf.home>
Message-ID: <CY4PR1201MB01208EF041ED95425B0B4677A16D0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, October 16, 2019 10:45 PM
> To: Evgeniy Didin <didin@synopsys.com>
> Cc: buildroot at busybox.net; arc-buildroot at synopsys.com
> Subject: Re: [arc-buildroot] [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2019.09-eng002
> 
> Hello Evgeniy,
> 
> On Tue, 15 Oct 2019 12:02:58 +0300
> Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:
> 
> > This commit bumps ARC toolchain to arc-2019.09-eng002.
> > We want to test how new toolchain-eng002 builds packages,
> > so we can make fixes before release of toolcain.
> >
> > Please note that it is an engineering build and it might have
> > all kinds of breakages, please don't use it for production builds
> >
> > Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: arc-buildroot at synopsys.com
> 
> When do you expect to have the final 2019.09 release available ? By the
> end of October ?

It's not decided yet. But we're in bug-fix only mode already and
would like to get more test coverage - thus submitting this patch for BR.
Once we're confident no major issues happen we'll cut RC1 and then once
we pass internal sign-off testing will cut the release.

That said for real "final-final" release we might be a bit late like
mid November etc due to the schedule of internal sign-off testing team
(though I haven't checked with them yet so it might slip even further),
but as long as we don't see major breakages with either RC1 or RC2 we'll
be happy with either option in BR release with possibility to do a minor
bump from RCx to final release on say .1 release of BR later.

Makes sense?

-Alexey
