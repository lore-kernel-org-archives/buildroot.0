From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 16:25:57 +0200
Subject: [Buildroot] [PATCH 1/1] mtd: Allow holes in volume ID table
In-Reply-To: <1532089807-97597-1-git-send-email-david.owens@rockwellcollins.com>
References: <1532089807-97597-1-git-send-email-david.owens@rockwellcollins.com>
Message-ID: <20180810162557.76df0848@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Jul 2018 07:30:07 -0500, David Owens wrote:
> A regression in the mtd package prevents non-consecutive ubi volume IDs
> from working properly.  This change reverts the commit [0].  The issue
> was originally described on the mtd mailing list:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2018-June/081562.html
> 
> [0] http://git.infradead.org/mtd-utils.git/commitdiff/dede98ffb706676309488d7cc660f569548d5930
> 
> Signed-off-by: David Owens <david.owens@rockwellcollins.com>
> ---
>  ...correct-error-number-in-ubi_get_vol_info1.patch | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 package/mtd/0001-revert-return-correct-error-number-in-ubi_get_vol_info1.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
