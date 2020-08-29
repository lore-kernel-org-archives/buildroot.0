From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:54:07 +0200
Subject: [Buildroot] [PATCH] infra/kconfig-package: quote HOSTCC_NOCCACHE
In-Reply-To: <20200829204252.31225-1-yann.morin.1998@free.fr>
References: <20200829204252.31225-1-yann.morin.1998@free.fr>
Message-ID: <20200829225407.0c804cdd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Aug 2020 22:42:52 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> HOSTCC may contain spaces, so needs to be quoted.

HOSTCC yes, but HOSTCC_NOCCACHE ?

> Most of the places hwere it is already quoted use double-quotes, so we
> use that.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Minor nit: the commit title prefix should be package/pkg-kconfig.mk.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
