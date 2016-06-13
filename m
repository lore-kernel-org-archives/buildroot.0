From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:21:24 +0200
Subject: [Buildroot] [PATCH v2 11/14] imx-vpuwrap: rename from
 libfslvpuwrap and bump version to 1.0.65
In-Reply-To: <0ac09adbf46a188dc7a81f05a438043a12d96330.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <0ac09adbf46a188dc7a81f05a438043a12d96330.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-yuLJCV=CZ+x4Rb9b3=Mcg54Hu+vvAnmvpic4GMdsKii1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:13 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> --Update 'nLastFrameEndPosPhy' in seqinit stage to avoid feed
>   the same SPS to vpu repeatedly.
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/d6b9490
>
> Implicitly tested through gstreamer as the 0.10 plugin relies on it:
>  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
