From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:56:26 +0200
Subject: [Buildroot] [PATCH 09/22] linux: allow packages to set options
In-Reply-To: <f51b10e282b3daaa2ac9dafe0e21eca96a9b2118.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
 <f51b10e282b3daaa2ac9dafe0e21eca96a9b2118.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <20200501155626.36943502@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Apr 2020 14:10:21 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> +* +LIBFOO_LINUX_CONFIG_FIXUPS+ lists the strictly required linux kernel
> +  options that are uncommon, and without which the package is
> +  *fundamentally* broken. This shall be a set of calls to one of the
> +  kconfig tweaking option: `KCONFIG_ENABLE_OPT`, `KCONFIG_DISABLE_OPT`,
> +  or `KCONFIG_SET_OPT`.
> +  This is seldom used, as package usually have no strict requirements on
> +  the kernel options. *Do not use this variable*, unless you really know
> +  that you need to set kernel options.

I've reworded this a bit to be less "strongly" worded.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
