From: Gary Bisson <bisson.gary@gmail.com>
Date: Fri, 19 Dec 2014 17:41:26 -0800
Subject: [Buildroot] [PATCH v5 00/15] Add Xorg support for iMX6
In-Reply-To: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
Message-ID: <5494D3C6.6060006@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerome, All,

On 12/09/2014 05:46 AM, J?r?me Pouiller wrote:
> Hello,
>
> Main purpose of this serie is to add support of Vivante GPU (found on imx6) to
> Xorg. This work is mainly adapted from Yocto.
>
> v5:
>    - Add references in commit log of xdriver_xf86-video-imx-viv
>    - Split qmx6_defconfig in two defconfig: a minimal one and a demo one
>
> v4:
>    - Fix example config in commit log of xdriver_xf86-video-imx-viv
>    - Add a note about OpenGL API in xdriver_xf86-video-imx-viv help
>
> v3:
>    - Respin on next
>    - Add patch to use self-extractible helper function
>    - Remove 'See freescale-imx.mk' comment
>    - Reword patch "gpu-viv-bin-mx6q: change output selection mecanisms"
>    - libdrm: Apply new patch naming policy
>    - xdriver_xf86-video-imx-viv: Apply new patch naming policy
>    - xdriver_xf86-video-imx-viv: Does not depends directly on glibc
>    - qt5base: Apply new patch naming policy
>    - qmx6_defconfig: Use internal toochain
>
> v2:
>    - Rebase on new version of mesa3d
>    - Reorder some patches (in order to make examples I provide in commit message
>      functional)
>    - Do not bump version of all freescale packages
>    - Bump kernel version of imx6 boards
> [snip]

I haven't tested this series of patch as Thomas had some remarks. Let me 
know if I should test it anyway or if I should wait for a v6.

Thanks,
Gary
