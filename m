From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 30 Apr 2018 11:18:59 +0200
Subject: [Buildroot] [PATCH v2] imx-alsa-plugins: new package
In-Reply-To: <20180428234033.385df291@windsurf>
References: <20180201132629.13188-1-joerg.krause@embedded.rocks>
 <20180428234033.385df291@windsurf>
Message-ID: <20180430091859.GA6283@a450s.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Apr 28, 2018 at 11:40:33PM +0200, Thomas Petazzoni wrote:
> Hello Gary,
> 
> Since you often look after all the Freescale/NXP stuff, would you mind
> reviewing this patch from J?rg ?

Sure. Sorry I haven't replied earlier but I usually miss patches I'm not
cc'd to.

> You can also find it on patchwork at
> https://patchwork.ozlabs.org/patch/868232/.

The patch looks good to me, it's simple enough (autotools, alsa
dependency). The only modification I would have done would be in the
Config.in help text which says:

+	  This package is provided by Freescale as-is and doesn't have
+	  an upstream.

This used to be the go-to help text for Freescale when they provided
everything as archives. Now that there's a Git repository for pretty
much all those packages I'd now say there's an upstream.

Although it is unclear how to contribute to those repositories. From
what I've seen some people sent email to the top contributors of the
repository directly.

Regards,
Gary
