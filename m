From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 23:20:14 +0200
Subject: [Buildroot] [RFC PATCH v3 1/1] support/kconfig: Bump to kconfig
 from Linux 4.17-rc2
In-Reply-To: <20180919113615.27036-1-petr.vorel@gmail.com>
References: <20180919113615.27036-1-petr.vorel@gmail.com>
Message-ID: <20180920232014.1c19988b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Sep 2018 13:36:15 +0200, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v2->v3:
> * Fix issues with building more that we need (menuconfig require
> unfortunately "make menuconfig" fails, because
> it wants ? reported by Thomas in [1]).

You forgot to "git add" the kconf_id.c file, so it was missing from the
patch. I've re-added it from the 4.17-rc2 Linux kernel source code, and
that fixed the problem, I was able to test
menuconfig/nconfig/xconfig/savedefconfig.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
