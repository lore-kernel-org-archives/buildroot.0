From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 7 Oct 2019 10:31:16 -0300
Subject: [Buildroot] imx-drm not getting installed
Message-ID: <CAOMZO5CLskrZpdWAeL98fgW8A4CcfHLY6=AfoKgamAAyDDDOYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

I am testing the latest Mesa 19.2 on imx6 (Etnaviv) and mx53
(Freedreno) and I notice that the imx-drm library is no longer getting
installed:

# /usr/share/Qt5/CinematicExperience/Qt5_CinematicExperience
MESA-LOADER: failed to open imx-drm (search paths /usr/lib/dri)
failed to load driver: imx-drm

# ls /usr/lib/dri
etnaviv_dri.so     kms_swrast_dri.so  swrast_dri.so
kgsl_dri.so        msm_dri.so
#

For imx6 I am using the configs/imx6-sabresd_qt5_defconfig target.

Any ideas?

Thanks,

Fabio Estevam
