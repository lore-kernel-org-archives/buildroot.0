From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 16:00:06 +0100
Subject: [Buildroot] [PATCH v2 2/4] board: orangepi: Add Orangepi One
 Plus support
In-Reply-To: <20181103125608.2255-2-jagan@amarulasolutions.com>
References: <20181103125608.2255-1-jagan@amarulasolutions.com>
 <20181103125608.2255-2-jagan@amarulasolutions.com>
Message-ID: <20181216160006.3ffaddfa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Nov 2018 18:26:06 +0530, Jagan Teki wrote:
> Add initial support for Orangepi One Plus board
> with below features:
> - U-Boot 2018.09
> - Linux 4.19.0-rc8
> - Default packages from buildroot
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - Use mainline u-boot
> - Use tag in Linux

Applied to master after fixing the extlinux.conf to drop the version of
the Linux kernel.

Also, is this board now supported in upstream U-Boot and Linux? If so,
it would be nice to use that.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
