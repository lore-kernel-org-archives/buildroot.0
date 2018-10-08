From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 17:42:59 +0200
Subject: [Buildroot] [PATCH] gpsd: upgrade to 3.18
In-Reply-To: <20181007192945.19874-1-zgyarmati@zgyarmati.de>
References: <20181007192945.19874-1-zgyarmati@zgyarmati.de>
Message-ID: <20181008174259.61808a63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Oct 2018 21:29:45 +0200, Zoltan Gyarmati wrote:
> Removing previously upstreamed build fix patch and add config
> option for the newly introduced Greis driver
> 
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  ...nc-build-when-ublox-not-selected-too.patch | 36 -------------------
>  package/gpsd/Config.in                        |  5 +++
>  package/gpsd/gpsd.hash                        |  2 +-
>  package/gpsd/gpsd.mk                          |  5 ++-
>  4 files changed, 10 insertions(+), 38 deletions(-)
>  delete mode 100644 package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
