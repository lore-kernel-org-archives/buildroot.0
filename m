From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 13 Oct 2020 22:07:32 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-gpu-viv: fix
 build issue with Wayland backend
In-Reply-To: <CAEyMn7ZM4Stiud_M2tnK=t-Z7Azot5LxBX9_kzxFUXgFqxikpg@mail.gmail.com>
References: <20200402130842.918696-1-gary.bisson@boundarydevices.com>
 <20200402130842.918696-3-gary.bisson@boundarydevices.com>
 <20200402162543.595ed9e7@windsurf.home>
 <20200402151026.GA934730@p1g2> <20200708122048.GB331830@p1g2>
 <CAEyMn7ZM4Stiud_M2tnK=t-Z7Azot5LxBX9_kzxFUXgFqxikpg@mail.gmail.com>
Message-ID: <20201013200732.GA167901@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heiko,

On Tue, Oct 13, 2020 at 08:30:50PM +0200, Heiko Thiery wrote:
> Hi Gary, Hi Thomas,
> 
> Am Mi., 8. Juli 2020 um 14:20 Uhr schrieb Gary Bisson
> <gary.bisson@boundarydevices.com>:
> >
> > Hi Thomas,
> >
> > Gentle ping on this, let me know if you see another approach that would
> > be better, I'm open to suggestions.
> >
> > I'd love to have Weston support for i.MX8M* fixed for next release and
> > my other series [1] depends on this patch.
> >
> > Then I am preparing patches to have VPU support using GStreamer-imx V2
> > for i.MX8M* as well.
> 
> Any news on that? I also would like to see weston support for imx8m in
> buildroot.

No, a Tested-by and/or Reviewed-by would definitely help the patch
getting further. Have you tried it?

> @Gary: did you try to fix that upstream?

What upstream? There's none to my knowledge. As mentioned in the commit
log, even NXP doesn't have a real solution for this.

Regards,
Gary
