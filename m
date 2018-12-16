From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 16:00:33 +0100
Subject: [Buildroot] [PATCH 3/4] board: orangepi: Add Orangepi Lite2
 support
In-Reply-To: <20181103125608.2255-3-jagan@amarulasolutions.com>
References: <20181103125608.2255-1-jagan@amarulasolutions.com>
 <20181103125608.2255-3-jagan@amarulasolutions.com>
Message-ID: <20181216160033.3e58a803@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Nov 2018 18:26:07 +0530, Jagan Teki wrote:
> Add initial support for Orangepi Lite2 board
> with below features:
> - U-Boot 2018.09
> - Linux 4.19.0-rc8
> - Default packages from buildroot
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .gitlab-ci.yml                              |  1 +
>  DEVELOPERS                                  |  2 +
>  board/orangepi/orangepi-lite2/extlinux.conf |  4 ++
>  board/orangepi/orangepi-lite2/genimage.cfg  | 33 +++++++++++++++
>  board/orangepi/orangepi-lite2/post-build.sh |  4 ++
>  board/orangepi/orangepi-lite2/readme.txt    | 35 +++++++++++++++
>  configs/orangepi_lite2_defconfig            | 47 +++++++++++++++++++++
>  7 files changed, 126 insertions(+)
>  create mode 100644 board/orangepi/orangepi-lite2/extlinux.conf
>  create mode 100644 board/orangepi/orangepi-lite2/genimage.cfg
>  create mode 100755 board/orangepi/orangepi-lite2/post-build.sh
>  create mode 100644 board/orangepi/orangepi-lite2/readme.txt
>  create mode 100644 configs/orangepi_lite2_defconfig

Applied to master after adjusting extlinux.conf as well. Also, please
send an update to the defconfig once this board is supported in
upstream U-Boot and Linux.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
