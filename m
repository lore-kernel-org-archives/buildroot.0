From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 6 Jun 2016 16:36:10 +0200
Subject: [Buildroot] [PATCH 10/10] xdriver_xf86-video-imx-viv: bump
 version to 5.0.11-p8.3
In-Reply-To: <5d2d6204a5f725c8f04eaf93459b75717297ae51.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <5d2d6204a5f725c8f04eaf93459b75717297ae51.1464958470.git.awebster@arcx.com>
Message-ID: <CAAMH-yv+fVHWTu9w6t4ojx0V+GvVcz1_1W4mj-Y9-DGBvrBtCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 3, 2016 at 3:13 PM, Andrew Webster <awebster@arcx.com> wrote:
> Remove upstreamed patch.
> Add patch from Yocto to not use git for versioning.
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/06a0574

Same as imx-gpu-viv package, I think we should go straight to version
p8.4. Also, can you re-order your patches to have this one after
imx-gpu-viv, just trying to have multimedia updates on one side and
then graphics update. Especially now that graphics can be updated
separately.

Finally, I forgot to mention it in my cover letter answer, please cc
me to the v2 series.

Regards,
Gary
