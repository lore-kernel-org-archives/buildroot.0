From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 26 Aug 2008 15:15:47 +0200
Subject: [Buildroot] Linux Kernel 2.6.17 support in Buildroot
In-Reply-To: <1B0F60C9E236904CB364F9EF52E0AFD90241B20E@sma10.technidata-ag.com>
References: <1B0F60C9E236904CB364F9EF52E0AFD90241B20E@sma10.technidata-ag.com>
Message-ID: <20080826131547.GI2213@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,

On Mon, Aug 25, 2008 at 10:01:18AM +0200, Bussmann, Paul wrote:

>Unfortunately, the current Linux Kernel does not support the Board and
>adding support to it is much too difficult to me.

2.6.17 was released around Jun 18  2006. I'd ask those people for a
vaguely recent kernel.

>I was glad about the feature that a custom Kernel is selectable in the
>Buildroot project configuration.
>Concerning the Toolchain settings, it seems to be not possible to select
>a custom version or version 2.6.17.
>
>How can I test if Buildroot would create a correct Toolchain using Linux
>2.6.17 instead of 2.6.26?

LTP comes to mind.

HTH,
