From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:29:18 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: remove AMLogic support
In-Reply-To: <20190810105955.22449-1-bernd.kuhls@t-online.de>
References: <20190810105955.22449-1-bernd.kuhls@t-online.de>
Message-ID: <20190811142918.359d84ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 10 Aug 2019 12:59:52 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Kodi 19 will remove specific support for AMLogic:
> https://github.com/xbmc/xbmc/pull/16043
> 
> Also buildroot dropped support for the odroid2c defconfig:
> https://git.buildroot.net/buildroot/commit/?id=b80712a16ae3deb65331a7923aa878e13e2e66b6
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy       |  7 +++++++
>  package/kodi/Config.in | 11 -----------
>  package/kodi/kodi.mk   | 10 ----------
>  3 files changed, 7 insertions(+), 21 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
