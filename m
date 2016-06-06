From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 6 Jun 2016 16:34:37 +0200
Subject: [Buildroot] [PATCH 08/10] libimxvpuapi: bump version to 0.10.2
In-Reply-To: <17186dba6267a09cda955857673d4198395a04c8.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <17186dba6267a09cda955857673d4198395a04c8.1464958470.git.awebster@arcx.com>
Message-ID: <CAAMH-yvmriGjCfKO40NctAVu4QzbPu25Q440aL1TFjLkm9+now@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 3, 2016 at 3:12 PM, Andrew Webster <awebster@arcx.com> wrote:
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
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
