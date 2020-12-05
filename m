From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:41:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.3.0
In-Reply-To: <20201203190133.2857147-1-bernd.kuhls@t-online.de>
References: <20201203190133.2857147-1-bernd.kuhls@t-online.de>
Message-ID: <20201205214115.4556261d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Dec 2020 20:01:33 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Rebased patch 0002 & 0003.
> Removed patch 0005 which was applied upstream.
> 
> Only Intel and Broadcom drivers depend on expat since upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=81a0f1eca24b8605b9f2506122ff90db7129c39e
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  ...t-proper-value-for-LIBCLC_INCLUDEDIR.patch | 20 +++++------
>  ...tion-to-disable-optional-neon-suppor.patch |  4 +--
>  ...xes-to-loader-when-using-x11-and-dri.patch | 35 -------------------
>  package/mesa3d/Config.in                      |  7 +++-
>  package/mesa3d/mesa3d.hash                    |  6 ++--
>  package/mesa3d/mesa3d.mk                      |  7 ++--
>  7 files changed, 27 insertions(+), 54 deletions(-)
>  delete mode 100644 package/mesa3d/0005-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
