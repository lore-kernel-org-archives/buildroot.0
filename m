From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 1 May 2013 08:57:11 +0200
Subject: [Buildroot] [PATCH v2 0/3] barebox new option and new boards
In-Reply-To: <1366184503-16875-1-git-send-email-fabio.porcedda@gmail.com>
References: <1366184503-16875-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC99e2ow4EK=duNQ3NhiTM450x0gEVRdAa2HqMLTK014tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 17, 2013 at 9:41 AM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> Hi all,
> this patch set is for adding to barebox a custom version option
> and use this new option to add suppport for two new boards.
>
> v2:
>   - Telit EVK-PRO3: use barebox custom version option
>
> Best regards
> Fabio Porcedda (3):
>   barebox: add custom version option
>   configs: add defconfig for Telit EVK-PRO3
>   configs: add defconfig for Atmel AT91SAM9260-EK Nand Flash Boot
>
>  .../linux-ARM-at91-enable-nand-ubifs-boot.patch    |  44 ++++
>  ...04.0-0001-watchdog-add-keep-alive-support.patch |  88 ++++++++
>  ...02-watchdog-add-at91sam9-watchdog-support.patch | 228 +++++++++++++++++++++
>  ...0003-at91sam9260-9g20-add-wathdog-support.patch |  40 ++++
>  ...0004-at91sam9260-9g20-fix-wathdog-support.patch |  26 +++
>  ...13.04.0-0005-watchdog-enable-for-evk-pro3.patch |  26 +++
>  ...t91-at91_dt_defconfig-update-for-evk-pro3.patch |  44 ++++
>  board/telit/evk-pro3/readme.txt                    |  28 +++
>  boot/barebox/Config.in                             |  26 ++-
>  configs/at91sam9260eknf_defconfig                  |  15 ++
>  configs/telit_evk_pro3_defconfig                   |  16 ++
>  11 files changed, 567 insertions(+), 14 deletions(-)
>  create mode 100644 board/atmel/at91sam9260ek/linux-ARM-at91-enable-nand-ubifs-boot.patch
>  create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
>  create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch
>  create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch
>  create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
>  create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
>  create mode 100644 board/telit/evk-pro3/linux-0001-ARM-at91-at91_dt_defconfig-update-for-evk-pro3.patch
>  create mode 100644 board/telit/evk-pro3/readme.txt
>  create mode 100644 configs/at91sam9260eknf_defconfig
>  create mode 100644 configs/telit_evk_pro3_defconfig
>
> --
> 1.8.1.4
>

Ping

Best regards
--
Fabio Porcedda
