From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  1 Apr 2014 11:12:48 +0200
Subject: [Buildroot] [PATCH v2 0/4] Miscellauneus patches
Message-ID: <1396343572-13551-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some miscellaneus patches.

v3:
 - remove already merged patches
 - add acked-by tags
 - fix a typo
v2:
 - Add three patches
 - Remove the already merged patch

Best regards

Fabio Porcedda (4):
  luajit: needs for 32bit archictectures a 32bit host gcc
  infra: add to luarocks support for top-level parallel make
  toolchain: add a hidden config option to enable the toolchain package
  Makefile: fix coding style

 Makefile                 | 186 +++++++++++++++++++++++------------------------
 package/luajit/Config.in |   1 +
 package/pkg-luarocks.mk  |   8 +-
 toolchain/Config.in      |   4 +
 4 files changed, 102 insertions(+), 97 deletions(-)

-- 
1.9.1
