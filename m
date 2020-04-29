From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 22:22:41 +0200
Subject: [Buildroot] [PATCH v2 0/5] imx: add i.MX8M Nano EVK board
 support
In-Reply-To: <1588151545-9346-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1588151545-9346-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200429222241.3ca00696@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Apr 2020 11:12:20 +0200
Stephane Viau <stephane.viau@oss.nxp.com> wrote:

> This series adds support for the NXP i.MX8M Nano EVK board.
> 
> Since the i.MX8M Nano CPU was added for the Nitrogen8MNano board, which has a
> type of memory (LPDDR4) different from the NXP reference board (DDR4), the first
> half of the series introduce the DDR training selection for the whole i.MX8 M
> SoC family.
> 
> The second half of the series adds support for i.MX8M Nano EVK Board with kernel/
> U-Boot based on 4.19.35_1.1.0, which is the current preferred version for all NXP
> reference boards.

Thanks for this new iteration. It was in our patchwork patch tracking
system, and it just disappeared. Has anyone removed these patches? You
Stephane? Someone else?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
