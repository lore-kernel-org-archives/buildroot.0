From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 11:34:45 +0200
Subject: [Buildroot] [PATCH 08/13] gpu-viv-bin-mx6q: rename package to
 imx-gpu-viv
In-Reply-To: <1432116744-25760-9-git-send-email-gary.bisson@boundarydevices.com>
References: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
 <1432116744-25760-9-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20150521113445.40004616@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Wed, 20 May 2015 12:12:19 +0200, Gary Bisson wrote:
> In order to be in line with new Freescale naming convention:
> 
> https://github.com/Freescale/meta-fsl-arm/commit/74c86aa9
> 
> "Graphics recipe is renamed from gpu-viv-bin-mx6q to imx-gpu-viv"
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

You need to add Config.in.legacy handling when renaming a package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
