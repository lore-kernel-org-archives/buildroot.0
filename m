From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Mon, 4 Feb 2019 08:27:43 +0000
Subject: [Buildroot] Prebuilt ARC tools are way too old
In-Reply-To: <20190204092548.15b42a23@windsurf>
References: <4881796E12491D4BB15146FE0209CE64681D2D2A@DE02WEMBXB.internal.synopsys.com>
 <20190204092548.15b42a23@windsurf>
Message-ID: <4881796E12491D4BB15146FE0209CE64681D2DA7@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Monday, February 4, 2019 11:26 AM
> To: Alexey Brodkin <alexey.brodkin@synopsys.com>
> Cc: ARC Maintainers <arc-buildroot@synopsys.com>; buildroot at buildroot.org
> Subject: Re: [Buildroot] Prebuilt ARC tools are way too old
> 
> Hello Alexey,
> 
> On Mon, 4 Feb 2019 08:13:11 +0000
> Alexey Brodkin <alexey.brodkin@synopsys.com> wrote:

[snip]

> > Probably there's not much sense in updating br-arcle-hs38.config with still obsolete
> > tools and better wait before GCC 8.x based tools are available in prebuilt form.
> 
> Thanks for pinging me on this! I'll rebuild the toolchain with 2018.11
> for now, and once 2019.02-rc1 is released, I'll rebuild again.

Cool, thanks!
Are you going to update the config fragment as well or should I do it myself?

-Alexey
