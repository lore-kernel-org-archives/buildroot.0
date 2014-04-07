From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon,  7 Apr 2014 11:56:46 +0200
Subject: [Buildroot] [PATCH v4 0/4] Miscellauneus patches
Message-ID: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some miscellaneus patches.

v4:
 - remove the already merged patch
 - rebase
 - add a new patch
 - change order to put the already acked patch at start
 - luajit patch: add a comment
v3:
 - remove already merged patches
 - add acked-by tags
 - fix a typo
v2:
 - Add three patches
 - Remove the already merged patch

Best regards

Fabio Porcedda (4):
  Makefile: fix coding style
  toolchain: add a hidden config option to enable the toolchain package
  Makefile: let show-targets prints also the dependencies
  luajit: needs for 32bit archictectures a 32bit host gcc

 Makefile                 | 201 +++++++++++++++++++++++------------------------
 package/luajit/Config.in |   4 +
 toolchain/Config.in      |   4 +
 3 files changed, 108 insertions(+), 101 deletions(-)

-- 
1.8.3.2
