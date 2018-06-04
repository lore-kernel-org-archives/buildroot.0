From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 4 Jun 2018 11:52:35 +0200
Subject: [Buildroot] [PATCH 3/3] weston: add weston-imx variant when
 using imx-gpu-viv
In-Reply-To: <a461da37-e484-57b9-be4d-f91ffbea9cae@mind.be>
References: <20180516155201.10279-1-gary.bisson@boundarydevices.com>
 <20180516155201.10279-4-gary.bisson@boundarydevices.com>
 <2d58cd37-effa-a5bf-5f9b-6d1e143062db@mind.be>
 <20180517130810.GA6584@g751.home>
 <a461da37-e484-57b9-be4d-f91ffbea9cae@mind.be>
Message-ID: <20180604095235.GA25676@g751.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout

On Thu, May 17, 2018 at 11:19:18PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 17-05-18 15:08, Gary Bisson wrote:
> > Hi Arnout,
> > 
> > On Wed, May 16, 2018 at 11:24:17PM +0200, Arnout Vandecappelle wrote:
> >>
> >>
> >> On 16-05-18 17:52, Gary Bisson wrote:
> [snip]
> >>> +ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
> >>> +ifeq ($(BR2_PACKAGE_IMX_GPU_G2D),y)
> >>
> >> WESTON_CONF_OPTS += --enable-imxg2d
> > 
> > Ok, I forgot you wanted that --enable-xxx options to be explicit
> > although it ends up in the 'unrecognized options'.
> 
>  So I took a look at the configure.ac, and of course they got it wrong;
> --enable-imxg2d will disable it. So your patch was correct.
> 
>  Reading documentation is apparently difficult :-)

Haha, thanks for checking.

>  Since I'm not entirely convinced of the config option myself anyway:
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thomas, I've seen you applied the rest of the series, do you have any
objection about that patch?

Regards,
Gary
