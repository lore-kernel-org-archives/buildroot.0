From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:38:02 +0200
Subject: [Buildroot] [PATCH v2 1/4] configs/imx6-sabresd_qt5: Move from
 mdev to eudev
In-Reply-To: <20191009170004.3542-1-festevam@gmail.com>
References: <20191009170004.3542-1-festevam@gmail.com>
Message-ID: <20191010223802.291011d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Oct 2019 14:00:01 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Since commit cf66a67112cd706d2e7 ("package/glmark2: drm support needs udev")
> udev is needed when the drm flavor is used.
> 
> Move from mdev to eudev in order to fix the following glmark2
> build failure:
> 
> Unknown flavor: . Supported flavors are dispmanx-glesv2, drm-gl,
> drm-glesv2, mir-gl, mir-glesv2, wayland-gl, wayland-glesv2, win32-gl,
> win32-glesv2, x11-gl, x11-glesv2
> 
> Suggested-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Fix Subject and commit log: from mdev to eudev

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
