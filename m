From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Aug 2019 00:18:59 +0200
Subject: [Buildroot] [PATCH] package/openblas: fix jaguar openblas target
In-Reply-To: <20190817173749.2403-1-romain.naour@gmail.com>
References: <20190817173749.2403-1-romain.naour@gmail.com>
Message-ID: <20190818001859.2094a65b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 17 Aug 2019 19:37:49 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> In commit [1] Peter said he will use BOBCAT for
> jaguar cpus. But JAGUAR was used instead.
> 
> Use BOBCAT as openblas target for JAGUAR cpus since
> it is not listed in openblas's target list [2].
> 
> [1] 5e6fa93483caac317ab8844feb2ae9c07078a6c8
> [2] https://github.com/xianyi/OpenBLAS/blob/release-0.3.0/TargetList.txt
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
> This patch can be backported to LTS version.
> ---
>  package/openblas/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
