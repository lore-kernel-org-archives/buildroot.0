From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 22:58:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/numactl: add
 BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
In-Reply-To: <7bacd6259e057a8bb62f0b7654842b43da630aec.1591278848.git.baruch@tkos.co.il>
References: <7bacd6259e057a8bb62f0b7654842b43da630aec.1591278848.git.baruch@tkos.co.il>
Message-ID: <20200604225819.513d398d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  4 Jun 2020 16:54:07 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> For use in other packages that select numactl.
> 
> Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/numactl/Config.in | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
