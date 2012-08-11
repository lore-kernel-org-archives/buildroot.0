From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 23:18:35 +0200
Subject: [Buildroot] [PATCH] Add support for the Calao-systems QIL-A9260
In-Reply-To: <501BFEF8.1010303@calao-systems.com>
References: <501BFEF8.1010303@calao-systems.com>
Message-ID: <20120811231835.2cbb2937@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 03 Aug 2012 18:40:24 +0200,
gregory hermant <gregory.hermant@calao-systems.com> a ?crit :

> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> ---
>  .../qil-a9260/at91bootstrap-1.16-qil-a9260.patch   |  603 ++++++++++++++++++++
>  .../qil-a9260/barebox-2012.07.0-qil-a9260.patch    |   36 ++
>  board/calao/qil-a9260/linux-3.4.7.config           |  111 ++++
>  board/calao/qil-a9260/linux-3.4.7.patch            |   27 +
>  configs/calao_qil_a9260_defconfig                  |   18 +
>  5 files changed, 795 insertions(+), 0 deletions(-)
>  create mode 100644 board/calao/qil-a9260/at91bootstrap-1.16-qil-a9260.patch
>  create mode 100644 board/calao/qil-a9260/barebox-2012.07.0-qil-a9260.patch
>  create mode 100644 board/calao/qil-a9260/linux-3.4.7.config
>  create mode 100644 board/calao/qil-a9260/linux-3.4.7.patch
>  create mode 100644 configs/calao_qil_a9260_defconfig

Thanks, applied to next. I have only removed the BR2_JLEVEL=2 from your
defconfig, since this is not board related.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
