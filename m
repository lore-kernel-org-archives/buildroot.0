From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu,  6 Mar 2014 10:41:54 +0100
Subject: [Buildroot] [PATCH v2 0/4] Misc patches
Message-ID: <1394098918-13464-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some misc patches.

v2:
 - Add three more patches

Regards
Fabio Porcedda

Fabio Porcedda (4):
  webkit: fix mmu reverse dependency moving it to %_ARCH_SUPPORTS
  Makefile: remove BASE_TARGETS variable
  linux: fix coding style
  linux: remove dirs dependency

 Makefile                            | 10 ++++----
 docs/manual/how-buildroot-works.txt |  9 ++++----
 linux/linux.mk                      | 46 ++++++++++++++++++-------------------
 package/webkit/Config.in            |  2 +-
 4 files changed, 32 insertions(+), 35 deletions(-)

-- 
1.8.3.2
