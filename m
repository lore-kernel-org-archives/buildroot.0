From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 22:57:56 +0200
Subject: [Buildroot] [PATCH 1/4] package/mesa3d: radeonSI: specify drm
 platform
In-Reply-To: <20180428172803.11179-1-romain.naour@gmail.com>
References: <20180428172803.11179-1-romain.naour@gmail.com>
Message-ID: <20180501225756.3f593d2e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Apr 2018 19:28:00 +0200, Romain Naour wrote:
> When BR2_PACKAGE_MESA3D_OPENGL_EGL is selected with RadeonSI drvier,
> mesa platform must be specified with drm.
> 
> Fixes:
> hecking for RADEON... yes
> checking for AMDGPU... yes
> configure: error: radeonsi requires one of these:
>                   1) --with-platforms=drm (X, Wayland, offscreen rendering based on DRM)
>                   2) --with-platforms=surfaceless (offscreen only)
>                   3) --with-platforms=android (Android only)
>                   Recommended options: drm,x11
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/mesa3d/mesa3d.mk | 2 ++
>  1 file changed, 2 insertions(+)

Entire series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
