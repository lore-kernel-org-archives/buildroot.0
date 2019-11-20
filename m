From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 22:32:47 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/linuxconsoletools: bump
 version to 1.7.0
In-Reply-To: <20191120161408.GA28902@coltrane>
References: <20191120161408.GA28902@coltrane>
Message-ID: <20191120223247.4834b573@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Koen,

Thanks a lot for the new iteration!

On Wed, 20 Nov 2019 17:14:09 +0100
Koen Martens <gmc@sonologic.nl> wrote:

> This version changed the (optional) dependency from sdl and
> sdl-config to sdl2 and pkg-config. Therefore, the patch
> 0002-sdl-config.patch has been dropped and the dependency
> has been changed to BR2_PACKAGE_SDL2.
> 
> Since SDL2 (required to build force-feedback utilities)
> requires shared library support to compile, a dependency
> on !BR2_STATIC_LIBS was added to the configuration option
> that enables force-feedback utilities.
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>
> ---
>  .../linuxconsoletools/0002-sdl-config.patch   | 20 -------------------
>  package/linuxconsoletools/Config.in           |  6 +++++-
>  .../linuxconsoletools/linuxconsoletools.hash  |  2 +-
>  .../linuxconsoletools/linuxconsoletools.mk    |  6 +++---
>  4 files changed, 9 insertions(+), 25 deletions(-)
>  delete mode 100644 package/linuxconsoletools/0002-sdl-config.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
