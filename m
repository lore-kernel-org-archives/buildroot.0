From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 15:42:10 +0200
Subject: [Buildroot] [PATCH] package/evtest: fix build with musl libc
In-Reply-To: <e2ce15f16bd923a646e479cae502778116258d1a.1566112990.git.baruch@tkos.co.il>
References: <e2ce15f16bd923a646e479cae502778116258d1a.1566112990.git.baruch@tkos.co.il>
Message-ID: <20190819154210.73305e0e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 18 Aug 2019 10:23:10 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Add a patch adding missing limits.h header include.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c5f1b95741b37f6d949b3407fff901a960c6b781/
> http://autobuild.buildroot.net/results/b09a6b340f0a96081a55764b5dad0c2c31240cef/
> http://autobuild.buildroot.net/results/90c7a092a5492699406d3f46e0039d253146b6b7/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-Add-missing-limits.h-include.patch   | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/evtest/0001-Add-missing-limits.h-include.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
