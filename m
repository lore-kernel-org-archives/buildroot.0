From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 21:29:17 +0200
Subject: [Buildroot] [PATCH 1/2] configs/solidrun_macchiatobin_*: use a
 Git commit for ATF
In-Reply-To: <20180423195954.30215-1-thomas.petazzoni@bootlin.com>
References: <20180423195954.30215-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180425212917.169b1162@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Apr 2018 21:59:53 +0200, Thomas Petazzoni wrote:
> The version of the ARM Trusted Firmware from Marvell was a Git branch,
> not a Git commit, leading to unreproducible results. So let's use a
> Git commit instead, which is the latest available from the branch that
> was previously used.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  configs/solidrun_macchiatobin_mainline_defconfig | 2 +-
>  configs/solidrun_macchiatobin_marvell_defconfig  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
