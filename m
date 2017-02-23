From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 21:46:57 +0100
Subject: [Buildroot] [PATCH v2] libimxvpuapi: bump to version 0.10.3
In-Reply-To: <1487817819-2928-1-git-send-email-danomimanchego123@gmail.com>
References: <1487817819-2928-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20170223214657.587cd201@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 21:43:39 -0500, Danomi Manchego wrote:
> Because with libimxvpuapi older than 0.10.3, the gst1-imx-0.12.3 "imxvpu"
> plugin will not build.
> 
> Changelog:
> * properly pass on color format in simplified JPEG encoder interface
> * add alternative write-callback-style encoding mode
>   also add encode example variant which uses write-callback style output
> * add support for "fake grayscale mode" in encoders
>   this is done by using I420 internally and filling the U and V planes
>   with 0x80 bytes
> * make sure JPEG quantization table is copied in standardized zig zag order
>   the VPU does not, so this has to be done explicitely
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
> 
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
