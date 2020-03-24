From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 21:27:58 +0100
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx7dsabresd: bump
 BSP components to 4.19.35_1.1.0
In-Reply-To: <20200324174015.125787-1-julien.olivain@oss.nxp.com>
References: <20200324174015.125787-1-julien.olivain@oss.nxp.com>
Message-ID: <20200324212758.63b45355@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

On Tue, 24 Mar 2020 18:40:15 +0100
Julien Olivain <julien.olivain@oss.nxp.com> wrote:

> Also dropped uboot patch accepted upstream in v2018.05 in
> commit f916757300c15aa1a3f0ccc98e7abb8a84c97da0
> 
> Tested-by: Julien Olivain <julien.olivain@oss.nxp.com>
> Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>

Thanks! I've applied.

Two comments:

 - This board does not have any developer associated to it in our
   DEVELOPERS file. Since you have apparently access to the hardware,
   would you be willing to add yourself in our DEVELOPERS file for this
   board ?

 - Having a Tested-by tag from yourself on a patch from yourself is not
   really relevant: if you're sending this patch, we assume you have
   tested it. Tested-by tags are more typically given by *other*
   developers who help in the review process by saying that they have
   tested a given patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
