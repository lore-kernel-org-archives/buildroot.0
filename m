From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:13:15 +0200
Subject: [Buildroot] [PATCH] scanpypi: place a warning into *.mk file if
 licence id couldn't be detected
In-Reply-To: <20180831150746.1804-1-yegorslists@googlemail.com>
References: <20180831150746.1804-1-yegorslists@googlemail.com>
Message-ID: <20180831231315.30d83172@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Aug 2018 17:07:46 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> If a license file could be found, but license id couldn't be detected place
> following warning into *.mk file:
> 
> FOO_LICENSE = FIXME: license id couldn't be detected
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  utils/scanpypi | 2 ++
>  1 file changed, 2 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
