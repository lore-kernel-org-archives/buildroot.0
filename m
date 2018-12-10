From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 11:50:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.3.0
In-Reply-To: <20181209204607.13857-1-bernd.kuhls@t-online.de>
References: <20181209204607.13857-1-bernd.kuhls@t-online.de>
Message-ID: <20181210115022.714db101@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Dec 2018 21:46:07 +0100, Bernd Kuhls wrote:
> Rebased patch 0002 after upstream commit
> https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=18.3&id=6b8657aff0adb9952aa3178d3b332de19d354561
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  ...vert-order-for-wayland-scanner-check.patch | 31 ++++++++++++-------
>  package/mesa3d/mesa3d.hash                    | 10 +++---
>  package/mesa3d/mesa3d.mk                      |  2 +-
>  4 files changed, 26 insertions(+), 19 deletions(-)

Applied to master, thanks. However, with the recent update of
pkg-config, there is a possibility that the patch 0002 is no longer
needed. Could you have a look at that ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
