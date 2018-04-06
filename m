From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:33:53 +0200
Subject: [Buildroot] [PATCH] configs/atmel_sama5d3xek: bump to
 linux4sam_5.8
In-Reply-To: <1522963168-27261-1-git-send-email-joshua.henderson@microchip.com>
References: <1522963168-27261-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180406213353.4acc2df0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 Apr 2018 14:19:28 -0700, Joshua Henderson wrote:
> Bump sama5d3xek to linux4sam_5.8. The 3 foundation components have their tags
> changed (AT91Bootstrap, U-Boot, Linux kernel).  This requires bumping the kernel
> header version and u-boot dtc as well.
> 
> at91bootstrap 3.8.10 is required to support gcc7.
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>  configs/atmel_sama5d3xek_defconfig | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
