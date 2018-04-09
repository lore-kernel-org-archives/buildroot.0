From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:18:41 +0200
Subject: [Buildroot] [PATCH] package/kmod: fix host install
In-Reply-To: <20180408081151.23331-1-yann.morin.1998@free.fr>
References: <20180408081151.23331-1-yann.morin.1998@free.fr>
Message-ID: <20180409111841.78321bd7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Apr 2018 10:11:51 +0200, Yann E. MORIN wrote:
> The host directory no longer uses /usr.
> 
> This currently works because we still have the  legacy /usr
> symlink, but for correctness it is better that we just fix it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/kmod/kmod.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
