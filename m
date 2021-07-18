From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 12:33:10 +0200
Subject: [Buildroot] [PATCH 1/1] configs: remove mesa3d kmsro-related
 options
In-Reply-To: <20210620083630.5813-1-bernd.kuhls@t-online.de>
References: <20210620083630.5813-1-bernd.kuhls@t-online.de>
Message-ID: <20210718123310.42dc5de0@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 20 Jun 2021 10:36:30 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed kmsro-related options, these are now handled by the mesa3d
> build system:
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=70813c1c13b99cb029c8fa3537163650bdd17b6d
> 
> The removal commit of the buildroot option
> https://git.buildroot.net/buildroot/commit/package/mesa3d?id=d51736f47296e3681cdb610765c73424272d42db
> 
> forgot to update the defconfigs, fixes
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066565
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  configs/engicam_imx6qdl_icore_qt5_defconfig | 1 -
>  configs/imx6-sabresd_qt5_defconfig          | 1 -
>  2 files changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
