From: Conrad Parker <conrad@metadecks.org>
Date: Mon, 16 Jun 2008 14:00:06 +0900
Subject: [Buildroot] [PATCH] update package/file version to 4.24
Message-ID: <dba6c0830806152200gb3171f7l800cd79945d9c1ef@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the following patch updates the version of file retrieved (the tarball
for the previous version is 404).

Conrad.

---
 package/file/file.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index 0498d24..9cacf53 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -3,7 +3,7 @@
 # file
 #
 #############################################################
-FILE_VERSION:=4.23
+FILE_VERSION:=4.24
 FILE_SOURCE:=file_$(FILE_VERSION).orig.tar.gz
 FILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/file
 FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VERSION)
-- 
1.5.4.3
