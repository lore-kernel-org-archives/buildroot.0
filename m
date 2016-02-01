From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:39:23 +0100
Subject: [Buildroot] [PATCH 06/10] libfslparser: bump to version 4.0.7
In-Reply-To: <1454154357-31625-7-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-7-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160201213923.2254a302@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Sat, 30 Jan 2016 12:45:53 +0100, Gary Bisson wrote:
> Changelog:
> - Add h264 parser version.
> - Support wide and 'ms 0x0 0x11' adpcm tag.
> - Support hev1 tag for hevc video codec.
> - TS segment fault.
> - Improve mkv parser's loading time when create parser with large size
> file.
> 
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/6406ad4
> https://github.com/Freescale/meta-fsl-arm/commit/09a532c
> https://github.com/Freescale/meta-fsl-arm/commit/371df94
> 
> This package has been implicitely tested through gstreamer as the 0.10
> plugin relies on it:
>  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/libfslparser/libfslparser.hash | 2 +-
>  package/libfslparser/libfslparser.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
