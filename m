From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 May 2016 18:24:48 -0300
Subject: [Buildroot] [PATCH] smartmontools: bump to version 6.5
Message-ID: <1462829088-17004-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/smartmontools/smartmontools.hash | 6 +++---
 package/smartmontools/smartmontools.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index bbaa6dd..2f2b7aa 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/smartmontools/files/smartmontools/6.4/
-md5	56812c8312fd123ed40ef65afde1049e	smartmontools-6.4.tar.gz
-sha1	855c7d555dd405e5b392b1631dc36dd9632db8b8	smartmontools-6.4.tar.gz
+# From http://sourceforge.net/projects/smartmontools/files/smartmontools/6.5/
+md5	093aeec3f8f39fa9a37593c4012d3156	smartmontools-6.5.tar.gz
+sha1	7e788b429534a4ae627858fbcc826b93402cee7e	smartmontools-6.5.tar.gz
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 6d0a82b..cd0c076 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 6.4
+SMARTMONTOOLS_VERSION = 6.5
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPLv2+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
-- 
2.7.3
