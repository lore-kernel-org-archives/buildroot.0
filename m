From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Aug 2012 02:43:45 +0200
Subject: [Buildroot] [PATCH] Add support for the HABA-KNX-LITE
In-Reply-To: <503B97EC.1000705@calao-systems.com>
References: <503B97EC.1000705@calao-systems.com>
Message-ID: <20120828024345.290a3aa0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 27 Aug 2012 17:53:16 +0200,
gregory hermant <gregory.hermant@calao-systems.com> a ?crit :

> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> ---
>  .../at91bootstrap-1.16-habaknxlite.patch           |  604 +++++++++++++++
>  .../barebox-2012.07.0-haba-knx-lite.patch          |  624 +++++++++++++++
>  board/calao/haba-knx-lite/linux-3.4.patch          |  819 ++++++++++++++++++++
>  configs/calao_haba_knx_lite_defconfig              |   30 +
>  4 files changed, 2077 insertions(+), 0 deletions(-)
>  create mode 100644 board/calao/haba-knx-lite/at91bootstrap-1.16-habaknxlite.patch
>  create mode 100644 board/calao/haba-knx-lite/barebox-2012.07.0-haba-knx-lite.patch
>  create mode 100644 board/calao/haba-knx-lite/linux-3.4.patch
>  create mode 100644 configs/calao_haba_knx_lite_defconfig

Thanks.

Do you have plans to push the Barebox and Linux kernel parts upstream?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
