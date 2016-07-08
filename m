From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 20:54:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 12.0.0
In-Reply-To: <1467992616-22201-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467992616-22201-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160708205434.49e23b3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Jul 2016 17:43:36 +0200, Bernd Kuhls wrote:
> Remove MESA3D_REMOVE_OPENGL_PC, not needed anymore after
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=12.0&id=5193fe9f4fe9c2d537afb051323724a399abc4e1
> 
> Tested using defconfig from
> https://git.buildroot.net/buildroot/commit/package/mesa3d/mesa3d.mk?id=e07a98239969794c2257345b17a604e309a5dbb1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk |  2 +-
>  package/mesa3d/mesa3d.hash               |  4 ++--
>  package/mesa3d/mesa3d.mk                 | 16 +---------------
>  3 files changed, 4 insertions(+), 18 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
