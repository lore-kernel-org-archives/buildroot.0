From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:58:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: Remove x86/x86_64
 dependency for nouveau Gallium driver
In-Reply-To: <20190928063856.11664-1-bernd.kuhls@t-online.de>
References: <20190928063856.11664-1-bernd.kuhls@t-online.de>
Message-ID: <20190928215822.197da852@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 08:38:55 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Nvidia chips are used on arm hardware as well like Jetson:
> https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/
> 
> Suggested-by: Ross Green <grunpferd@netscape.net>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
