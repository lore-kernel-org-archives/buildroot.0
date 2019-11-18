From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 22:39:39 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/linuxconsoletools: bump
 version to 1.7.0
In-Reply-To: <20191117135913.GD13372@coltrane>
References: <20191117135913.GD13372@coltrane>
Message-ID: <20191118223939.13b3f725@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Nov 2019 14:59:13 +0100
Koen Martens <gmc@sonologic.nl> wrote:

> This version changed the (optional) dependency from sdl and
> sdl-config to sdl2 and pkg-config. Therefore, the patch that
> provided the correct path to sdl-config has been dropped and
> the dependency has been changed to BR2_PACKAGE_SDL2.
> 
> Somehow, SDL2 fails to build without shared library support,
> but this is not explicitly depended on by SDL2, therefore
> a dependency to BR2_SHARED_LIBS was added to the force-
> feedback utility configuration option.
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .../linuxconsoletools/0002-sdl-config.patch   | 20 -------------------

Minor additional nit: ideally the commit log should explain why this
patch is dropped.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
