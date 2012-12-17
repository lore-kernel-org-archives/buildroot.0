From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Mon, 17 Dec 2012 23:49:01 +0100 (CET)
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <50CF99CC.8040603@mind.be>
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
 <50CF5987.90805@mind.be> <87mwxc76je.fsf@dell.be.48ers.dk>
 <50CF9647.3020506@mind.be>
 <1905374549.1044823.1355782331560.JavaMail.root@advansee.com>
 <50CF99CC.8040603@mind.be>
Message-ID: <1254101768.1047923.1355784541411.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 17, 2012 11:16:44 PM, Arnout Vandecappelle wrote:
> On 17/12/12 23:12, Beno?t Th?baudeau wrote:
> > On Monday, December 17, 2012 11:01:43 PM, Arnout Vandecappelle
> > wrote:
> >> On 17/12/12 21:44, Peter Korsgaard wrote:
> >>> Is the gst-fsl-plugins stuff still needed now that the coda
> >>> driver
> >>> is in
> >>> mainline?
> >>
> >>    Mainline v3.7 only has support for mx27 and mx51.
> >
> > Even for mx27 and mx51, are you sure that the mainline
> > implementation for CODA
> > is compatible with Freescale's imx-lib? I highly doubt it.
> 
>   Peter's point is that with coda you don't need all that proprietary
> stuff, it's just a media framework device.

Sure. But isn't there a custom (or not yet developed generic V4L2 mem2mem)
GStreamer plugin required for the mainline CODA implementation? There is also
the question of the CSI and IPU features that are not yet available in mainline,
even for mx27 and mx51.

Perhaps in BuildRoot there could be a solution for packages from Freescale, and
another one for mainline stuff as long as mainline does not provide all
features.

Regards,
Beno?t
