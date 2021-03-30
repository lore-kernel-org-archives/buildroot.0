From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 21:44:39 +0200
Subject: [Buildroot] [PATCH] package/fastd: add FASTD_CPE_ID_VERSION
In-Reply-To: <20210329192905.19883-1-post@lespocky.de>
References: <20210329152803.594a910f@windsurf.home>
 <20210329192905.19883-1-post@lespocky.de>
Message-ID: <20210330214439.4a65c5af@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Mar 2021 21:29:05 +0200
Alexander Dahl <post@lespocky.de> wrote:

> With that FASTD_CPE_ID expands to:
> 
>     cpe:2.3:a:fastd_project:fastd:21.0:*:*:*:*:*:*:*
> 
> That's the same as listed on
> https://nvd.nist.gov/products/cpe/detail/826746
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>  package/fastd/fastd.mk | 1 +
>  1 file changed, 1 insertion(+)

Thanks a lot for taking a look at this! Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
