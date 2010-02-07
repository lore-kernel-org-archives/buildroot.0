From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 08 Feb 2010 00:55:55 +0100
Subject: [Buildroot] [PATCH 13/14] target: added BR2_KARCH option
In-Reply-To: <20100207184636.GE5229@mx.loc>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
	<1265566076-10628-14-git-send-email-llandwerlin@gmail.com>
	<20100207184636.GE5229@mx.loc>
Message-ID: <1265586955.18332.1.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dimanche 07 f?vrier 2010 ? 19:46 +0100, Bernhard Reutner-Fischer a
?crit :
> On Sun, Feb 07, 2010 at 07:07:55PM +0100, llandwerlin at gmail.com wrote:
> >From: Lionel Landwerlin <llandwerlin@gmail.com>
> >
> >For packages building kernel modules (ie linux-fusion), it is required
> >to give the ARCH=some_arch argument to make so the kernel's makefile
> >are aware of the target architecture. We didn't had the value to fill
> >the ARCH variable. BR2_KARCH variable is computed using the BR2_ARCH
> >variable.
> 
> There is/was KERNEL_ARCH in there since ages.

Thx for pointed this, and let's forget this patch...

linux-fusion bump patch updated.

-- 
Lionel Landwerlin
