From: Andrew Webster <Awebster@arcx.com>
Date: Mon, 6 Jun 2016 18:19:33 +0000
Subject: [Buildroot] [PATCH 02/10] gst1-imx: bump to version 0.12.1
In-Reply-To: <CAAMH-yucxbR7vdu5mF=m5q=6btK1UzHjfa8=obVnuD0J90Wttw@mail.gmail.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <1acf85bcc2a25fa6282c6057699b20e26548d905.1464958470.git.awebster@arcx.com>
 <CAAMH-yucxbR7vdu5mF=m5q=6btK1UzHjfa8=obVnuD0J90Wttw@mail.gmail.com>
Message-ID: <27930718e1534f5ba829ef4437f829dd@WEBMAIL.arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Gary Bisson [mailto:gary.bisson at boundarydevices.com]
> Sent: Monday, June 06, 2016 10:33 AM
> To: Andrew Webster
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 02/10] gst1-imx: bump to version 0.12.1
> 
> Andrew, All,
> 
> On Fri, Jun 3, 2016 at 3:10 PM, Andrew Webster <awebster@arcx.com>
> wrote:
> > Changelog:
> > * compositor: Rename ImxCompositor(Pad) to ImxVideoCompositor(Pad)
> >   This prevents conflicts if both the NXP plugins and the gstreamer-imx
> >   are installed in the same rootfs
> >
> > * Add switches to wscript configuration to enable/disable plugins
> >   Until now, all plugins were built (unless their dependencies were
> >   missing). On some i.MX machines, some features are missing. For
> >   example, the i.MX7 has no VPU. To ensure deterministic builds, it is
> >   useful to selectively disable plugins in the build.
> 
> This update is actually very important, we can now explicitly select which
> element we want to be built. As said to Baruch[1], I think this package should
> be reworked more deeply in order to have a menu allowing to select the
> elements to be built.
> 
> Since the switches to wscript configuration are brought by this update, my
> opinion is that it should be done in one patch. I can take care of it if you don't
> want to.

I'll take a look to see what's required here and get back to you.

> 
> Regards,
> Gary
> 
> [1]: http://patchwork.ozlabs.org/patch/611642/
