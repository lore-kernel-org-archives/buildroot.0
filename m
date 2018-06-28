From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu, 28 Jun 2018 13:56:57 +0300
Subject: [Buildroot] [PATCH 0/3] Enable packages for ARC external toolchain
Message-ID: <20180628105700.29015-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the latest ARC prebuilt toolchain arc-2018.03 mpv,mpd amd xterm
packages are building without any errors.

This patch is as a prerequisite for this series:
https://patchwork.ozlabs.org/patch/935666/

Evgeniy Didin (3):
  mpd: enable for ARC external toolchain
  mpv: enable for ARC external toolchain
  xterm: enable for ARC external toolchain

 package/mpd/Config.in   | 3 ---
 package/mpv/Config.in   | 3 ---
 package/xterm/Config.in | 2 --
 3 files changed, 8 deletions(-)

-- 
2.17.1
