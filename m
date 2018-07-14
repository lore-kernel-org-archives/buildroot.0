From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 22:21:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_mkfontscale: select
 dependencies
In-Reply-To: <20180713195136.7213-1-bernd.kuhls@t-online.de>
References: <20180713195136.7213-1-bernd.kuhls@t-online.de>
Message-ID: <20180714222112.48d65667@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Jul 2018 21:51:36 +0200, Bernd Kuhls wrote:
> xapp_mkfontscale depends on xproto_xproto & zlib but did not select
> them.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xapp_mkfontscale/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
