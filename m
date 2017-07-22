From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 15:18:18 +0200
Subject: [Buildroot] [PATCH] configs: nitrogen*: bump kernel and u-boot
 revisions
In-Reply-To: <20170721091026.22364-1-gary.bisson@boundarydevices.com>
References: <20170721091026.22364-1-gary.bisson@boundarydevices.com>
Message-ID: <20170722151818.1e75a682@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 11:10:26 +0200, Gary Bisson wrote:
> Here are the main U-Boot modifications:
> - Rebase on top of mainline 2017.03 release
> - Fix sparse image flashing issues
> 
> Here are the main Linux modifications:
> - Add mma8451 driver support
> - Fix possible TiWi spurious interrupts issue
> - Fix Ethernet interrupt parent issue
> - Add USB Type C TUSB320 controller support
> - Add SOM2 i.MX6DL and i.MX6QP variants
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  configs/nitrogen6sx_defconfig | 6 +++---
>  configs/nitrogen6x_defconfig  | 8 ++++----
>  configs/nitrogen7_defconfig   | 6 +++---
>  3 files changed, 10 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
