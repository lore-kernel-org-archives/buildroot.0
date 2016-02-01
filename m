From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:39:18 +0100
Subject: [Buildroot] [PATCH 05/10] libfslcodec: bump to version 4.0.7
In-Reply-To: <1454154357-31625-6-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-6-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160201213918.493fe0a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Sat, 30 Jan 2016 12:45:52 +0100, Gary Bisson wrote:
> Changelog since 4.0.3:
> - Add mx7 SoC support.
> - Add test binary to release package.
> - Fix segmentation fault issue with only standard build.
> - Build std only for arm11 and arm12.
> - Fix some mp3_dec noise issue of c code for arm11 and arm9.
> 
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/47b2677
> https://github.com/Freescale/meta-fsl-arm/commit/c88fd22
> https://github.com/Freescale/meta-fsl-arm/commit/3220a4c
> 
> This package has been implicitely tested through gstreamer as the 0.10
> plugin relies on it:
>  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/libfslcodec/libfslcodec.hash | 2 +-
>  package/libfslcodec/libfslcodec.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
