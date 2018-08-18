From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 11:21:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-ati:
 fix glamor dependency
In-Reply-To: <20180818090950.17428-1-bernd.kuhls@t-online.de>
References: <20180818090950.17428-1-bernd.kuhls@t-online.de>
Message-ID: <20180818112125.0d9efb1f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 11:09:50 +0200, Bernd Kuhls wrote:
> Glamor support needs egl, fix dependency after
> https://git.buildroot.net/buildroot/commit/?id=5b4bcbdafbe8e7b42d4e085a0524d70665cdbaf5
> 
> Fixes
> http://autobuild.buildroot.net/results/6ac/6acd5ad820a47fc3442d3e3a5d8d72b396fb6e41/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
