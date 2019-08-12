From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 22:41:57 +0200
Subject: [Buildroot] [PATCH] package/ti-gfx: do not use devmem2 in script
In-Reply-To: <20190811230143.10490-1-unixmania@gmail.com>
References: <20190811230143.10490-1-unixmania@gmail.com>
Message-ID: <20190812224157.03f92128@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Aug 2019 20:01:43 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> ti-gfx may install a debug script that uses devmem2 but does not select
> BR2_PACKAGE_DEVMEM2. Use devmem, instead, already provided by Busybox.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> CC: Ciro Santilli <ciro.santilli@gmail.com>
> ---
> Found while investigating https://bugs.busybox.net/show_bug.cgi?id=10171

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
