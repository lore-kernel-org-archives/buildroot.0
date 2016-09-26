From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Sep 2016 10:28:21 +0200
Subject: [Buildroot] [PATCH] configs: nitrogen*: bump kernel and u-boot
	revision
In-Reply-To: <20160926082041.2443-1-gary.bisson@boundarydevices.com>
References: <20160926082041.2443-1-gary.bisson@boundarydevices.com>
Message-ID: <20160926102821.33169ebc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Sep 2016 10:20:41 +0200, Gary Bisson wrote:
> Here are the main U-Boot modifications:
> - Add Spansion flash support
> - Add secure boot (HAB) support
> 
> Here are the main Linux modifications:
> - Add HDMI2CSI 75Hz support
> - Add KD024FM display support
> - Fix PCIe reset gpios in device tree
> - Backport xhci fixes from mainline
> - Fix SOM PHY address bug
> - Enable IPU Prefetch engine for 6QP
> - Fix ft5x06 touch bug
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi all,

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
