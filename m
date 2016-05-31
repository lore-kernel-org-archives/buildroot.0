From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 22:15:44 +0200
Subject: [Buildroot] [PATCH] configs: remove trailing directory slashes
In-Reply-To: <1463599570-21602-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463599570-21602-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160531221544.2db755e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 16:26:10 -0300, Gustavo Zacarias wrote:
> They're not necessary and look bad.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  configs/beaglebone_defconfig          | 2 +-
>  configs/calao_qil_a9260_defconfig     | 2 +-
>  configs/calao_tny_a9g20_lpw_defconfig | 2 +-
>  configs/calao_usb_a9263_defconfig     | 2 +-
>  configs/calao_usb_a9g20_lpw_defconfig | 2 +-
>  configs/qemu_m68k_mcf5208_defconfig   | 2 +-
>  configs/stm32f429_disco_defconfig     | 2 +-
>  configs/stm32f469_disco_defconfig     | 2 +-
>  configs/warpboard_defconfig           | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
