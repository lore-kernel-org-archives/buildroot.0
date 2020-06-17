From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 21:10:49 +0200
Subject: [Buildroot] [PATCH v2 15/17] board/olpc: document flashing the
 JFFS2 image
In-Reply-To: <20200617104925.1036330-16-lkundrak@v3.sk>
References: <20200617104925.1036330-1-lkundrak@v3.sk>
 <20200617104925.1036330-16-lkundrak@v3.sk>
Message-ID: <20200617211049.5a19b57e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Jun 2020 12:49:23 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> +Flashing the JFFS2 image (XO-1 only)
> +====================================
> +
> +Unlike XO-1.75, the internal NAND flash on XO-1 is accessed without a FTL
> +and needs a filesystem flash-friendly filesystem. A build configured for

"filesystem flash-friendly filesystem" was one filesystem too many :-)

I fixed that when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
