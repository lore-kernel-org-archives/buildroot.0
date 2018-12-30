From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 15:29:05 +0100
Subject: [Buildroot] [PATCH 1/4] arch/arm: drop useless conditional
 dependencies for 64-bit-only cores
In-Reply-To: <4afed8038e54fcc8f5053c2d526f489047f3c344.1546179362.git.yann.morin.1998@free.fr>
References: <cover.1546179362.git.yann.morin.1998@free.fr>
 <4afed8038e54fcc8f5053c2d526f489047f3c344.1546179362.git.yann.morin.1998@free.fr>
Message-ID: <20181230152905.47247235@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Dec 2018 15:16:10 +0100, Yann E. MORIN wrote:
> Those cores are already guarded by a 64-bit-only condition, so they
> can't even select additional options in non-64-bit mode anyway...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  arch/Config.in.arm | 9 ---------
>  1 file changed, 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
