From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 21:28:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.2.6
In-Reply-To: <20181203185352.32400-1-bernd.kuhls@t-online.de>
References: <20181203185352.32400-1-bernd.kuhls@t-online.de>
Message-ID: <20181203212805.33476655@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 19:53:52 +0100, Bernd Kuhls wrote:
> Added manditory dependency to xlib_libXxf86vm
> https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=18.2&id=f05ce9dc514427a661696bc6b908e30841b6eb9d
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk |  2 +-
>  package/mesa3d/Config.in                 |  1 +
>  package/mesa3d/mesa3d.hash               | 10 +++++-----
>  package/mesa3d/mesa3d.mk                 |  6 ++----
>  4 files changed, 9 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
