From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:59:40 +0100
Subject: [Buildroot] [PATCH 14/14] configs: nitrogen*: bump kernel
 version to 3.14.52-1.1.0_ga
In-Reply-To: <1458140214-22303-15-git-send-email-gary.bisson@boundarydevices.com>
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-15-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160319145940.1c67da00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Wed, 16 Mar 2016 15:56:54 +0100, Gary Bisson wrote:
> Also add device tree of our Nitrogen6_Max QuadPlus version:
> https://boundarydevices.com/product/nitrogen6max/
> 
> As well as our latest SOM version:
> https://boundarydevices.com/product/nit6x-som-v2/
> 
> Using the latest commit of our 3.14.52 kernel branch:
> https://github.com/boundarydevices/linux-imx6/commits/boundary-imx_3.14.52_1.1.0_ga
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  configs/nitrogen6sx_defconfig | 4 ++--
>  configs/nitrogen6x_defconfig  | 6 +++---
>  configs/nitrogen7_defconfig   | 3 ++-
>  3 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
