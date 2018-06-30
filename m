From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 21:43:20 +0200
Subject: [Buildroot] [PATCH] qpdf: security bump to version 8.1.0
In-Reply-To: <f3824d1a8cf1971f29912fa0891ba7e597066d2d.1530249538.git.baruch@tkos.co.il>
References: <f3824d1a8cf1971f29912fa0891ba7e597066d2d.1530249538.git.baruch@tkos.co.il>
Message-ID: <20180630214320.364879e7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jun 2018 08:18:58 +0300, Baruch Siach wrote:
> Fixes CVE-2018-9918: mishandle certain "expected dictionary key but
> found non-name object" cases, allowing remote attackers to cause a
> denial of service (stack exhaustion)
> 
> https://github.com/qpdf/qpdf/issues/202
> 
> Drop local SHA256 hash since we use upstream provided SHA512.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/qpdf/qpdf.hash | 6 ++----
>  package/qpdf/qpdf.mk   | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
