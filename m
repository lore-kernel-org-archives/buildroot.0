From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:21:35 +0200
Subject: [Buildroot] [PATCH v2 13/14] imx-lib: bump version to 5.4
In-Reply-To: <c15929189545aca13e272e5a2feae1cc32553d24.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <c15929189545aca13e272e5a2feae1cc32553d24.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-ys9u6oZETBrBiTMhKsRAVMnd35nVKR0UnkejjzsX2AuwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:13 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> - Remove platform check in hdmi-cec and imx-lib - simplify to support builds
> on multiple machines
> - For ipu use the dummy defaul object to fix build issues on non-ipu hardware
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/7946533
>
> Implicitly tested through gstreamer as the
> plugins rely on them for vpu decoding, e.g.:
>  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
>  # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
>  # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
>    matroskademux ! imxvpudec ! imxipuvideosink
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
