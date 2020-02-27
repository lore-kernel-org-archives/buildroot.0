From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:10:59 +0100
Subject: [Buildroot] [PATCH] configs/{at91,
 atmel}*_defconfig: move to bluez5_utils
In-Reply-To: <20200227070722.5477-1-peter@korsgaard.com>
References: <20200227070722.5477-1-peter@korsgaard.com>
Message-ID: <20200227091059.12a7039b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 08:07:22 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Commit 61a813339af43 (package/bluez_utils: drop package) removed
> bluez-utils, but forgot to update the defconfigs.  Fix them by changing to
> bluez5-utils instead.
> 
> Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/451176867 and many
> others.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  configs/at91sam9x5ek_dev_defconfig               | 2 +-
>  configs/at91sam9x5ek_mmc_dev_defconfig           | 2 +-
>  configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 2 +-
>  configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 2 +-
>  configs/atmel_sama5d3_xplained_dev_defconfig     | 2 +-
>  configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 2 +-
>  configs/atmel_sama5d4_xplained_dev_defconfig     | 2 +-
>  configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
