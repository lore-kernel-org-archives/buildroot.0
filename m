From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:35:00 +0100
Subject: [Buildroot] [PATCH 3/4] fs/f2fs: simplify overprovision option
In-Reply-To: <20181106140647.18251-3-grzegorz@blach.pl>
References: <20181106140647.18251-1-grzegorz@blach.pl>
 <20181106140647.18251-3-grzegorz@blach.pl>
Message-ID: <20181108213500.5a5d4619@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Nov 2018 15:06:46 +0100, Grzegorz Blach wrote:
> Setting overprovision to 0 and omitting this option has exactly
> the same effect.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  fs/f2fs/f2fs.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
