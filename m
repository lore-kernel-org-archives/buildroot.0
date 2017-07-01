From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 17:45:10 +0200
Subject: [Buildroot] [PATCH] olimex_imx233: refactor with genimage.sh
In-Reply-To: <20170701153433.11906-1-francois.perrad@gadz.org>
References: <20170701153433.11906-1-francois.perrad@gadz.org>
Message-ID: <20170701174510.08a506bd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Jul 2017 17:34:33 +0200, Francois Perrad wrote:
> instead of use a freescale script
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Could you explain why this is an improvement? The whole idea of
board/freescale/common/mxs/post-image.sh is to have a single
genimage.cfg.template file that covers all MXS boards. So your change
doesn't seem to go in the right direction.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
