From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  7 Jan 2018 23:11:28 +0300
Subject: [Buildroot] [PATCH 0/2] cleanup: xradio package and orangepi boards
Message-ID: <20180107201130.12952-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a couple of cleanup patches. The first patch adds license file hash
for xr819-xradio package. The second patch drops custom Orange Pi post-image
and post-build scripts replacing them by generic Buildroot tools.

Regards,
Sergey

Sergey Matyukevich (2):
  xr819-xradio: add license file hash
  orangepi: drop custom post-build and post-image scripts


 b/configs/orangepi_lite_defconfig             |    6 ++++--
 b/configs/orangepi_one_defconfig              |    6 ++++--
 b/configs/orangepi_pc_defconfig               |    6 ++++--
 b/configs/orangepi_pc_plus_defconfig          |    6 ++++--
 b/configs/orangepi_zero_defconfig             |    6 ++++--
 b/package/xr819-xradio/xr819-xradio.hash      |    2 ++
 board/orangepi/orangepi-lite/post-build.sh    |    1 -
 board/orangepi/orangepi-lite/post-image.sh    |    1 -
 board/orangepi/orangepi-one/post-build.sh     |    1 -
 board/orangepi/orangepi-one/post-image.sh     |    1 -
 board/orangepi/orangepi-pc-plus/post-build.sh |    1 -
 board/orangepi/orangepi-pc-plus/post-image.sh |    1 -
 board/orangepi/orangepi-pc/post-build.sh      |    1 -
 board/orangepi/orangepi-pc/post-image.sh      |    1 -
 board/orangepi/orangepi-zero/post-build.sh    |    1 -
 board/orangepi/orangepi-zero/post-image.sh    |    1 -
 board/orangepi/post-build.sh                  |   11 -----------
 board/orangepi/post-image.sh                  |   14 --------------
 18 files changed, 22 insertions(+), 45 deletions(-)
