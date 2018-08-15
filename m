From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 00:40:50 +0200
Subject: [Buildroot] [PATCH v2] bzip2: change upstream site
In-Reply-To: <59cd8eb281eed8b9102b8d2a56aa6ff50f0a9a80.1534220691.git.baruch@tkos.co.il>
References: <59cd8eb281eed8b9102b8d2a56aa6ff50f0a9a80.1534220691.git.baruch@tkos.co.il>
Message-ID: <20180816004050.08f49167@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 07:24:51 +0300, Baruch Siach wrote:
> The bzip.org website is down. Use the Buildroot backup download site.
> Remove the website link as there is no clear alternative upstream at
> this point.
> 
>   https://lwn.net/Articles/762264/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/bzip2/Config.in | 2 --
>  package/bzip2/bzip2.mk  | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
