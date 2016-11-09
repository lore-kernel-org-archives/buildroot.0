From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:53:39 +0100
Subject: [Buildroot] [PATCH 1/3] configs: remove calao*_defconfig
In-Reply-To: <1478352758-28778-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1478352758-28778-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161109225339.0d96ae4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Nov 2016 14:32:36 +0100, Thomas Petazzoni wrote:
> The calao defconfigs no longer build with gcc 5.x, due to Linux kernel
> versions used being too old. However, it is unlikely that anyone will
> ever update them, since Calao Systems has gone bankrupt in April 2016.
> 
> Therefore, let's remove them. If anyone is interested again at some
> point, it will be easy to revive them from the Git history.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  board/calao/qil-a9260/linux-3.4.7.config           | 111 ---
>  .../patches/at91bootstrap/0001-qil-a9260.patch     | 603 ---------------
>  .../qil-a9260/patches/barebox/0001-qil-a9260.patch |  36 -
>  .../qil-a9260/patches/linux/0001-qil-a9260.patch   |  27 -
>  .../at91bootstrap-1.16-tny-a9g20-lpw.patch         | 551 -------------
>  board/calao/tny-a9g20-lpw/linux-3.9.config         | 187 -----
>  .../usb-a9260/at91bootstrap-1.16-usb-a9260.patch   | 603 ---------------
>  board/calao/usb-a9260/linux-3.7.4.config           |  97 ---
>  .../usb-a9263/at91bootstrap-1.16-usb-a9263.patch   | 851 ---------------------
>  board/calao/usb-a9263/linux-3.4.4.config           | 102 ---
>  board/calao/usb-a9g20-lpw/linux-3.4.4.config       | 105 ---
>  .../patches/at91bootstrap/0001-usb-a9g20-lpw.patch | 610 ---------------
>  .../patches/barebox/0001-usb-a9g20-lpw.patch       |  12 -
>  configs/calao_qil_a9260_defconfig                  |  20 -
>  configs/calao_tny_a9g20_lpw_defconfig              |  29 -
>  configs/calao_usb_a9260_defconfig                  |  18 -
>  configs/calao_usb_a9263_defconfig                  |  17 -
>  configs/calao_usb_a9g20_lpw_defconfig              |  17 -
>  18 files changed, 3996 deletions(-)
>  delete mode 100644 board/calao/qil-a9260/linux-3.4.7.config
>  delete mode 100644 board/calao/qil-a9260/patches/at91bootstrap/0001-qil-a9260.patch
>  delete mode 100644 board/calao/qil-a9260/patches/barebox/0001-qil-a9260.patch
>  delete mode 100644 board/calao/qil-a9260/patches/linux/0001-qil-a9260.patch
>  delete mode 100644 board/calao/tny-a9g20-lpw/at91bootstrap-1.16-tny-a9g20-lpw.patch
>  delete mode 100644 board/calao/tny-a9g20-lpw/linux-3.9.config
>  delete mode 100644 board/calao/usb-a9260/at91bootstrap-1.16-usb-a9260.patch
>  delete mode 100644 board/calao/usb-a9260/linux-3.7.4.config
>  delete mode 100644 board/calao/usb-a9263/at91bootstrap-1.16-usb-a9263.patch
>  delete mode 100644 board/calao/usb-a9263/linux-3.4.4.config
>  delete mode 100644 board/calao/usb-a9g20-lpw/linux-3.4.4.config
>  delete mode 100644 board/calao/usb-a9g20-lpw/patches/at91bootstrap/0001-usb-a9g20-lpw.patch
>  delete mode 100644 board/calao/usb-a9g20-lpw/patches/barebox/0001-usb-a9g20-lpw.patch
>  delete mode 100644 configs/calao_qil_a9260_defconfig
>  delete mode 100644 configs/calao_tny_a9g20_lpw_defconfig
>  delete mode 100644 configs/calao_usb_a9260_defconfig
>  delete mode 100644 configs/calao_usb_a9263_defconfig
>  delete mode 100644 configs/calao_usb_a9g20_lpw_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
