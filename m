From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  2 Dec 2020 19:33:00 +0100
Subject: [Buildroot] [PATCH/next v1] package/iw: bump version to 5.9
Message-ID: <20201202183300.32579-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iw/iw.hash | 2 +-
 package/iw/iw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index 0aa51563f1..126b1cb673 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256  a2469f677088d7b1070a7fbb28f3c747041697e8f6ec70783339cb1bc27a395f  iw-5.4.tar.xz
+sha256  293a07109aeb7e36267cf59e3ce52857e9ffae3a6666eb8ac77894b1839fe1f2  iw-5.9.tar.xz
 # Locally calculated
 sha256  5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af  COPYING
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 2250ea413b..9f4095e9dc 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 5.4
+IW_VERSION = 5.9
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
-- 
2.29.2
