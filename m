From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:47:50 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: bump version to
 19.2.0
In-Reply-To: <20190926061134.2945-1-bernd.kuhls@t-online.de>
References: <20190926061134.2945-1-bernd.kuhls@t-online.de>
Message-ID: <20190927224750.0bc62ba0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Sep 2019 08:11:34 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated license hash after cosmetical upstream commits:
> https://cgit.freedesktop.org/mesa/mesa/log/docs/license.html?h=19.2
> 
> Upstream removed asm configure option:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=19.2&id=20294dceebc23236e33b22578245f7e6f41b6997
> 
> Removed dependency to DRI swrast driver for
> BR2_PACKAGE_MESA3D_OSMESA_CLASSIC after upstream commit
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=19.2&id=b816edcbf40abca1e3d68b1a706f5670b3fcf4d7
> removed this dependency.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: squashed patch to remove DRI swrast dependency (Yann, Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
