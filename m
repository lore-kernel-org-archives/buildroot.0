From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 19:02:48 +0200
Subject: [Buildroot] [PATCH v3 4/4] configs/stm32mp157c-dk2: add support
 for wifi
In-Reply-To: <20201007144945.1697081-4-shlomi.39sd@gmail.com>
References: <20201007144945.1697081-1-shlomi.39sd@gmail.com>
 <20201007144945.1697081-4-shlomi.39sd@gmail.com>
Message-ID: <20201014190248.2d91b51f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  7 Oct 2020 17:49:45 +0300
Shlomi Vaknin <shlomi.39sd@gmail.com> wrote:

> Adding support for wifi for stm32mp157c-dk2 is achieved by using
> another dts which includes the bindings for the wifi module.
> In addition, a txt file for the wifi firmware was added.
> This was copied from the yocto bsp layer of st.
> 
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> ---
>  .../stm32mp157c-dk2/linux.config              |  4 +-
>  .../overlay/boot/extlinux/extlinux.conf       |  2 +-
>  .../brcmfmac43430-sdio.st,stm32mp157c-dk2.txt | 59 +++++++++++++++++++
>  .../stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts  | 32 ++++++++++
>  configs/stm32mp157c_dk2_defconfig             |  7 ++-
>  5 files changed, 100 insertions(+), 4 deletions(-)
>  create mode 100644 board/stmicroelectronics/stm32mp157c-dk2/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157c-dk2.txt
>  create mode 100644 board/stmicroelectronics/stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts

Since there are still some issues apparently with this patch, I marked
it as Changes Requested.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
