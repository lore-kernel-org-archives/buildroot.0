From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 17:36:37 +0200
Subject: [Buildroot] [PATCH] configs: Use HTTPS URL for Github repos
In-Reply-To: <1467714314-18935-1-git-send-email-paul.cercueil@analog.com>
References: <1467714314-18935-1-git-send-email-paul.cercueil@analog.com>
Message-ID: <20160705173637.702a1ec7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Jul 2016 12:25:14 +0200, Paul Cercueil wrote:
> This makes it possible to clone git repositories hosted on Github while
> behind a firewall.
> 
> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
> ---
>  configs/acmesystems_aria_g25_128mb_defconfig    | 2 +-
>  configs/acmesystems_aria_g25_256mb_defconfig    | 2 +-
>  configs/acmesystems_arietta_g25_128mb_defconfig | 2 +-
>  configs/acmesystems_arietta_g25_256mb_defconfig | 2 +-
>  configs/at91sam9g45m10ek_defconfig              | 2 +-
>  configs/at91sam9rlek_defconfig                  | 2 +-
>  configs/at91sam9x5ek_defconfig                  | 2 +-
>  configs/atmel_sama5d3_xplained_defconfig        | 2 +-
>  configs/atmel_sama5d3xek_defconfig              | 2 +-
>  configs/atmel_sama5d4_xplained_defconfig        | 2 +-
>  configs/atmel_sama5d4_xplained_mmc_defconfig    | 2 +-
>  configs/atmel_sama5d4ek_defconfig               | 2 +-
>  configs/via_imx6_vab820_defconfig               | 4 ++--
>  configs/zynq_microzed_defconfig                 | 2 +-
>  configs/zynq_zc706_defconfig                    | 4 ++--
>  configs/zynq_zed_defconfig                      | 2 +-
>  16 files changed, 18 insertions(+), 18 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
