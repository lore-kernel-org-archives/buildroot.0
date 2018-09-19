From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Sep 2018 15:28:48 +0200
Subject: [Buildroot] [RFC PATCH v3 1/1] support/kconfig: Bump to kconfig
 from Linux 4.17-rc2
In-Reply-To: <20180919113615.27036-1-petr.vorel@gmail.com>
References: <20180919113615.27036-1-petr.vorel@gmail.com>
Message-ID: <20180919152848.616fc616@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

Thanks for working on this!

On Wed, 19 Sep 2018 13:36:15 +0200, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v2->v3:
> * Fix issues with building more that we need (menuconfig require
> unfortunately "make menuconfig" fails, because
> it wants ? reported by Thomas in [1]).

I don't understand this changelog. Could explain a bit more what you
mean here?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
