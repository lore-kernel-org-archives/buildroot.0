From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jun 2018 22:23:28 +0200
Subject: [Buildroot] [PATCH] libnss: remove upstream patch
In-Reply-To: <ffa3247006ac91b78cf3fca059ad1f00035b0d16.1527969140.git.baruch@tkos.co.il>
References: <ffa3247006ac91b78cf3fca059ad1f00035b0d16.1527969140.git.baruch@tkos.co.il>
Message-ID: <20180602222328.3cf46567@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jun 2018 22:52:20 +0300, Baruch Siach wrote:
> The merge of the next branch failed to remove an upstream applied patch.
> 
> Fixes:
> http://autobuild.buildroot.net/results/31f/31fe428584ada680f30d11e5d1abfbc533c0a70e/
> http://autobuild.buildroot.net/results/bb2/bb25363497dfd7fd5f8a81c28110fab87d5c2dc8/
> http://autobuild.buildroot.net/results/70a/70adacf85154d2a663808cf0db69849b6a490457/
> 
> Cc: Joseph Kogut <joseph.kogut@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...d-stringop-truncation-warning-r-fran.patch | 33 -------------------
>  1 file changed, 33 deletions(-)
>  delete mode 100644 package/libnss/0004-Bug-1438426-Avoid-stringop-truncation-warning-r-fran.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
