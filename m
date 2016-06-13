From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:21:11 +0200
Subject: [Buildroot] [PATCH v2 10/14] imx-parser: rename from
 libfslparser and bump version to 4.0.9
In-Reply-To: <605423330d42aee494d4b1addf05e08df982ad49.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <605423330d42aee494d4b1addf05e08df982ad49.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-yv5xRVPhy5e2JL0VQuEn=2ZLCbnZopV+S60Yo77+NAjBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:13 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> --Add aac latm parser in parser_libs, support aac latm in mpeg2 parser
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/e2c6f10
>
> Implicitly tested through gstreamer as the 0.10 plugin relies on it:
>  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
