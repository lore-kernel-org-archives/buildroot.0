From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:21:05 +0200
Subject: [Buildroot] [PATCH v2 09/14] imx-codec: rename from libfslcodec
 and bump version to 4.0.9
In-Reply-To: <40cfade361025d1493e33a1679ac1c028383a519.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <40cfade361025d1493e33a1679ac1c028383a519.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-yscOGgWO_6QxPk3rfttKD9zF8rWiphVpGBL5strj-pmEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:13 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> --[aac_dec] refine the code for pure c build
>   aac decoder c build need float point support, which use some
>   float point function.
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/4b91194
>
> Implicitly tested through gstreamer as the 0.10 plugin relies on it:
>  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
