From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Feb 2021 21:08:58 +0100
Subject: [Buildroot] [PATCH v2] package/wlroots,
 package/cage: change mesa3d dependency to virtual libegl/libgles
In-Reply-To: <20210213123353.4146-1-gilles.talis@gmail.com>
References: <20210213123353.4146-1-gilles.talis@gmail.com>
Message-ID: <20210216210858.54663d15@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Feb 2021 13:33:53 +0100
Gilles Talis <gilles.talis@gmail.com> wrote:

> Since commits:
> https://github.com/swaywm/wlroots/commit/c2288a7b88240e4377bfc1c67b44efb58f704a42
> https://github.com/swaywm/wlroots/commit/e18599b05e0f0cbeba11adbd489e801285470eab
> 
> Mesa dependency is no longer required. Wlroots is able to run on drivers
> that provide EGL and GLES2.0 support, and with specific EGL wayland extensions.
> (thus the BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency)
> 
> This was verified on NXP's i.MX8MMini using imx-gpu-viv driver.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
> Changes v1 -> v2:
>  - Added BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency
>  - Squashed wlroots and cage patches in one single patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
