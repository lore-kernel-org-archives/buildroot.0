From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 23 Sep 2019 21:11:01 +0200
Subject: [Buildroot] [PATCH] package/fio: bump to version 3.16
Message-ID: <1569265861-7351-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/fio/fio.hash | 2 +-
 package/fio/fio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index f6ec1f3..2950fe7 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 a84e663518c8e25ef8f9a1f6a92a91b28b4cc8f648d4d26728a8bfc1dafdce74  fio-3.15.tar.gz
+sha256 988ba0ed7488968fdccc882ceadd2124370825d0a1317ae4fdd80d5f2acc31da  fio-3.16.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index c88e7d2..357d093 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.15
+FIO_VERSION = 3.16
 FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
-- 
2.7.4
