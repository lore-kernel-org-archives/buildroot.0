From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 10:43:46 +0100
Subject: [Buildroot] [PATCH v10 2/6] prelink-cross: new package
In-Reply-To: <20190206091531.104591-2-aduskett@gmail.com>
References: <20190206091531.104591-1-aduskett@gmail.com>
 <20190206091531.104591-2-aduskett@gmail.com>
Message-ID: <20190317104346.7343805a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Feb 2019 04:15:27 -0500
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Prelink-cross emulates a runtime linker for a given sysroot. This is
> necessary to allow gobject-introspection to build it's typelib files
> during cross-compiling.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v7:
>   - Add patch to series.

The visible Config.in.host is not needed, for now, this package is just
used as a build dependency of gobject-introspection. So I've dropped
the visible Config.in.host option, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
