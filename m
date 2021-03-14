From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 14 Mar 2021 23:43:56 +0100
Subject: [Buildroot] [PATCH/2021.2 v1] package/genimage: fix for WSL
 (Windows-Subsystem for Linux)
In-Reply-To: <20210314231951.092ee00a@windsurf.home>
References: <20210310191651.20769-1-ps.report@gmx.net>
 <20210314231951.092ee00a@windsurf.home>
Message-ID: <20210314234356.27b5ae4b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 14 Mar 2021 23:19:51 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
>
> On Wed, 10 Mar 2021 20:16:51 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - add upstream patch ([1]) to fix usage with WSL (Windows-Subsystem for Linux)
> >
> > Fixes:
> >
> >   - https://bugs.busybox.net/show_bug.cgi?id=13146
> >   - https://bugs.busybox.net/show_bug.cgi?id=13601
> >
> >   ERROR: hdimage(sdcard.img): fiemap .../images/boot.vfat: 25 Inappropriate ioctl for device
> >   ERROR: hdimage(sdcard.img): failed to write image partition 'boot'
> >
> > [1] https://github.com/pengutronix/genimage/commit/4c2b02df0861e06ca9320d80ad60994d4a239ad6.patch
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> You tagged this patch 2021.02. Does this mean that:
>
>  - It should be applied *only* for 2021.02, and not master? If so, for
>    what reason?

On master genimage version is already bumped to 14 (containing the
upstream patch already)..., on 2021.02 genimage is still on version
13...

Regards,
Peter

>
>  - It should be applied to both 2021.02 and master ?
>
> Thanks for having investigated this, just this week, I had a
> participant to my training course running under WSL2 who faced exactly
> that issue.
>
> Best regards,
>
> Thomas
