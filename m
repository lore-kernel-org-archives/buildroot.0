From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:43:39 +0200
Subject: [Buildroot] [PATCH] skeleton: create include/ directory
In-Reply-To: <9873d2e0023b87545478d0615eb5d97bcbd82c2c.1526268236.git.baruch@tkos.co.il>
References: <9873d2e0023b87545478d0615eb5d97bcbd82c2c.1526268236.git.baruch@tkos.co.il>
Message-ID: <20180519224339.2fbf9c23@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 May 2018 06:23:56 +0300, Baruch Siach wrote:
> Don't rely on a random host package to create the include/ directory for
> us. Some packages do the wrong thing since they implicitly assume that
> this directory exists already. Commit a557aedad2 (zstd: fix host headers
> installation) shows an example of that.
> 
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/skeleton/skeleton.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
