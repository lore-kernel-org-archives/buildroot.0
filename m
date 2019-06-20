From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 21:50:02 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/x11r7/xapp_mkfontscale:
 bump version to 1.2.1
In-Reply-To: <20190602104519.7789-1-bernd.kuhls@t-online.de>
References: <20190602104519.7789-1-bernd.kuhls@t-online.de>
Message-ID: <20190620215002.3c074969@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  2 Jun 2019 12:45:17 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated license hash after upstream commit
> https://gitlab.freedesktop.org/xorg/app/mkfontscale/commit/8609ad731b9c9c670a815c915055ae416d2396d8
> 
> Release notes:
> https://lists.x.org/archives/xorg-announce/2019-March/002988.html
> 
> This version bump "now includes the mkfontdir script previously
> distributed separately for compatibility with older X11 versions."
> 
> Removing the buildroot package host-xapp_mkfontdir will be done by
> subsequent patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash | 12 ++++++------
>  package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk   |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
