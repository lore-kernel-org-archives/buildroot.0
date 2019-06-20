From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 21:27:42 +0200
Subject: [Buildroot] [PATCH] arch/nds32: force syntax colouring to
 kconfig.
In-Reply-To: <20190603191951.22360-1-yann.morin.1998@free.fr>
References: <20190603191951.22360-1-yann.morin.1998@free.fr>
Message-ID: <20190620212742.25d97ac3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  3 Jun 2019 21:19:51 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> It is too sad when an editor picks up the wrong syntax...
> 
> Like was done in e837837791 for all the other archs, force
> syntax to kconfig for nds32 too.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Nylon Chen <nylon7@andestech.com>
> ---
>  arch/Config.in.nds32 | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
