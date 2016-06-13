From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:21:30 +0200
Subject: [Buildroot] [PATCH v2 12/14] libimxvpuapi: bump version to
	0.10.2
In-Reply-To: <df0c4f0fd9b4e441e3eef3ef4af55dce72302ce6.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <df0c4f0fd9b4e441e3eef3ef4af55dce72302ce6.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-ytLzBG0Ld-Ofw1NN48m_TVAvYwt6FyS4T+sjzQs3c4dPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:13 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> - fix AUD NAL positioning in h.264 encoder output
>   (SPS/PPS/AUD were ordered incorrectly - AUD has to come first, not last)
> - fix build error with examples when --enable-static is used
> - pass quality factor in simplified JPEG encoder interface correctly
> - add functions for querying and setting header data
>   useful for modifying headers, like VUI data in the SPS RBSP
> - documentation updates
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/c999668
>
> Implicitly tested through gstreamer as the plugin relies on it:
>  # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
