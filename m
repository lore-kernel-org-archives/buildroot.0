From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 22:39:12 +0200
Subject: [Buildroot] [PATCH] gst1-imx: make kernel dependency optional
In-Reply-To: <97bf649b600a5548cfd3c53575747a057f24e07e.1460973919.git.baruch@tkos.co.il>
References: <97bf649b600a5548cfd3c53575747a057f24e07e.1460973919.git.baruch@tkos.co.il>
Message-ID: <20160612223912.39f0cf39@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 13:05:19 +0300, Baruch Siach wrote:
> The i.MX specific kernel headers are not a hard dependency. Quoting README.md:
> 
>   Without [--kernel-headers], the [ipu.h] header is not found, and elements
>   using the IPU will not be built.
> 
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/gstreamer1/gst1-imx/Config.in   | 10 +++-------
>  package/gstreamer1/gst1-imx/gst1-imx.mk |  9 ++++++---
>  2 files changed, 9 insertions(+), 10 deletions(-)

Since Gary said the patch was OK (even though he didn't gave explicitly
his Acked-by or Reviewed-by), I applied Baruch's patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
