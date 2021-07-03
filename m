From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:35:41 +0200
Subject: [Buildroot] [PATCH] package/openocd: require wchar for the
 xds110 driver
In-Reply-To: <acbeaaffd34a068b66bde44fd96046faf2096c04.1625151247.git.baruch@tkos.co.il>
References: <acbeaaffd34a068b66bde44fd96046faf2096c04.1625151247.git.baruch@tkos.co.il>
Message-ID: <20210703233541.03ec56ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  1 Jul 2021 17:54:07 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> The xds110 driver requires wchar, and is enabled by default. Make sure
> to disable xds110 when wchar support is missing.
> 
> Fixes:
> http://autobuild.buildroot.net/results/530bfe22ff509cf4ebfdf99a183312a1053f505f/
> http://autobuild.buildroot.net/results/956538a0a6029137db19cce30dc340e2e30dd166/
> http://autobuild.buildroot.net/results/ae7da2ce1389ece44a4ca65108fee02e318df7b3/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/openocd/Config.in  | 9 +++++++++
>  package/openocd/openocd.mk | 1 +
>  2 files changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
