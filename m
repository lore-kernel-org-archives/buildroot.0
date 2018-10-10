From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:23:06 +0200
Subject: [Buildroot] [PATCH 0/4] webkitgtk: assorted fixes and
 improvements
In-Reply-To: <20181009220852.4309-1-aperez@igalia.com>
References: <20181009220852.4309-1-aperez@igalia.com>
Message-ID: <20181010212306.4ed63bd1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 01:08:48 +0300, Adrian Perez de Castro wrote:

> Adrian Perez de Castro (4):
>   webkitgtk: move JSC JIT selection logic to kconfig
>   webkitgtk: enable package for aarch64
>   webkitgtk: enable JIT support on 32-bit MIPS

I've applied those first three patches. Thanks!

>   webkitgtk: explicitly set USE_GSTREAMER_GL build option

I'll comment on this one.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
