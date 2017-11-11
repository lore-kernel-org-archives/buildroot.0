From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:30:06 +0100
Subject: [Buildroot] [PATCH] configs/at91: refactor to use genimage.sh
In-Reply-To: <1510164921-11497-2-git-send-email-joshua.henderson@microchip.com>
References: <1510164921-11497-1-git-send-email-joshua.henderson@microchip.com>
 <1510164921-11497-2-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20171111233006.33f0a242@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Nov 2017 11:15:21 -0700, Joshua Henderson wrote:
> Prefer the commom genimage.sh instead of a custom post-image.sh script.
> 
> Cc: Ludovic Desroches <ludovic.desroches@atmel.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>  board/atmel/at91sam9x5ek_mmc/post-image.sh | 20 --------------------
>  configs/at91sam9x5ek_mmc_defconfig         |  3 ++-
>  configs/at91sam9x5ek_mmc_dev_defconfig     |  3 ++-
>  3 files changed, 4 insertions(+), 22 deletions(-)
>  delete mode 100755 board/atmel/at91sam9x5ek_mmc/post-image.sh

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
