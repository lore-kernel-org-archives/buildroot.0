From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:39:27 +0100
Subject: [Buildroot] [PATCH 07/10] libfslvpuwrap: bump to version 1.0.61
In-Reply-To: <1454154357-31625-8-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-8-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160201213927.327dfdef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Sat, 30 Jan 2016 12:45:54 +0100, Gary Bisson wrote:
> Changelog:
> - Enable resolution change for H.263 and VP8
> 
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/f11936b
> 
> This package has been implicitely tested through gstreamer as the
> plugins rely on it for vpu decoding:
>  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
>  # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
>  # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
>    matroskademux ! imxvpudec ! imxipuvideosink
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/libfslvpuwrap/libfslvpuwrap.hash | 2 +-
>  package/libfslvpuwrap/libfslvpuwrap.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
