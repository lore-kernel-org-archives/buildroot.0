From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:33:58 +0200
Subject: [Buildroot] [PATCH] configs/atmel: bump at91 defconfigs to
 at91bootstrap 3.8.10
In-Reply-To: <1522963215-29303-1-git-send-email-joshua.henderson@microchip.com>
References: <1522963215-29303-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180406213358.627a8778@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 Apr 2018 14:20:15 -0700, Joshua Henderson wrote:
> Bump at91sam9260ek, at91sam9g20, at91sam9g45m10ek, and at91sam9rlek to
> at91bootstrap 3.8.10.
> 
> at91bootstrap 3.8.10 is required to support gcc7.
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>  configs/at91sam9260eknf_defconfig  | 2 +-
>  configs/at91sam9g20dfc_defconfig   | 2 +-
>  configs/at91sam9g45m10ek_defconfig | 2 +-
>  configs/at91sam9rlek_defconfig     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
