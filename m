From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Dec 2018 13:14:34 +0100
Subject: [Buildroot] [PATCH] ci20: Fix U-Boot build with codesourcery
 toolchain
In-Reply-To: <20181112181928.26634-1-ezequiel@collabora.com>
References: <20181112181928.26634-1-ezequiel@collabora.com>
Message-ID: <20181215131434.212e1a95@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Nov 2018 15:19:28 -0300, Ezequiel Garcia wrote:
> Currently, U-Boot is failing to build, due to some issues
> with the toolchain and the U-Boot port.
> 
> Fix it.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

The issue I see with this fix is that it only fixes the problem for
that particular defconfig. Anyone else trying to build U-Boot with this
toolchain for MIPS will hit the same issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
