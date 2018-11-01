From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 21:21:15 +0100
Subject: [Buildroot] [PATCH] lua-curl: fix build with libcurl 7.62.0
In-Reply-To: <6fc47b7d2219db0c3ede0ab64d207c62bfca285c.1541096104.git.baruch@tkos.co.il>
References: <6fc47b7d2219db0c3ede0ab64d207c62bfca285c.1541096104.git.baruch@tkos.co.il>
Message-ID: <20181101212115.0632ec28@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Nov 2018 20:15:04 +0200, Baruch Siach wrote:
> The last libcurl bump changed error code definitions in a way that
> breaks lua-curl build. Add a patch to fix that.
> 
> Fixes:
> http://autobuild.buildroot.net/results/fa6/fa6e289162124b3e079c4a2d9c3f00910c8cc063/
> http://autobuild.buildroot.net/results/7b9/7b962a63630abaed21d99f719c1bd710ec4d4b28/
> http://autobuild.buildroot.net/results/c5b/c5b2a7f21259bbf79861bd95a2d7ca055920bf09/
> 
> Cc: Francois Perrad <francois.perrad@gadz.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-Fix-build-with-curl-7.62.0.patch     | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
