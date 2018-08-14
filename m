From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 23:39:55 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/lvm2: bump version to
 2.02.180
In-Reply-To: <20180726171524.479-2-m.niestroj@grinn-global.com>
References: <20180726171524.479-1-m.niestroj@grinn-global.com>
 <20180726171524.479-2-m.niestroj@grinn-global.com>
Message-ID: <20180814233955.2fa26ff3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcin,

On Thu, 26 Jul 2018 19:15:24 +0200, Marcin Niestroj wrote:
> lvm2 starting from version 2.02.178 depends on libaio library.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
> Changes v2 -> v3:
>  * Add missing libaio dependency in luksmeta (suggested by Baruch)

Applied to next, thanks. I have submitted a follow-up patch that bumps
libaio, with the consequence that it no longer has any architecture
dependency. This allows to remove all the
BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS dependencies, which is nice. Feel free
to have a look/review the patch I posted.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
