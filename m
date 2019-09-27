From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:20:51 +0200
Subject: [Buildroot] [PATCH 1/1] sdl2_ttf:  bump to version 2.0.15
In-Reply-To: <20190923164553.26745-1-peter.macleod.thompson@gmail.com>
References: <20190923164553.26745-1-peter.macleod.thompson@gmail.com>
Message-ID: <20190927232051.74ba5575@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 10:45:53 -0600
Peter Thompson <peter.macleod.thompson@gmail.com> wrote:

> From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> 
> Bumped sdl2_ttf to version 2.0.15
> Removed patches 0001-fix-opengl-detection.patch
> and 0002-fix-autoreconfig.patch as they are now upstream.
> Removed AUTORECONF=YES from .mk file since patches are gone
> 
> Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> ---
>  package/sdl2_ttf/0001-fix-opengl-detection.patch | 37 ------------------------
>  package/sdl2_ttf/0002-fix-autoreconf.patch       | 30 -------------------
>  package/sdl2_ttf/sdl2_ttf.hash                   |  4 +--
>  package/sdl2_ttf/sdl2_ttf.mk                     |  5 +---
>  4 files changed, 3 insertions(+), 73 deletions(-)
>  delete mode 100644 package/sdl2_ttf/0001-fix-opengl-detection.patch
>  delete mode 100644 package/sdl2_ttf/0002-fix-autoreconf.patch

Applied to master after fixing the commit title to include the
package/sdl2_ttf prefix, and improving a bit the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
