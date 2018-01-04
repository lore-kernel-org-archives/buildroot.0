From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu,  4 Jan 2018 21:36:26 +0300
Subject: [Buildroot] [PATCH 0/2] Bump xr819 and rtl8189fs versions
Message-ID: <20180104183628.3913-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here are updates for two out-of-tree wifi kernel modules: xradio and rtl8189fs.
Both drivers have been updated according to mac80211 and timer API changes
in the upcoming Linux v4.15.

Regards,
Sergey

Sergey Matyukevich (2):
  rtl8189fs: bump revision to 569bdb91
  xradio: bump version to 33f4b1c2


 rtl8189fs/rtl8189fs.hash       |    2 +-
 rtl8189fs/rtl8189fs.mk         |    2 +-
 xr819-xradio/xr819-xradio.hash |    2 +-
 xr819-xradio/xr819-xradio.mk   |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
