From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Oct 2015 14:27:59 -0300
Subject: [Buildroot] [PATCH] smartmontools: bump to version 6.4
Message-ID: <1443806879-27138-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/smartmontools/smartmontools.hash | 5 +++--
 package/smartmontools/smartmontools.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index 5a80691..bbaa6dd 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  a777065d1a5965d71b3672e054b09b7696200ec73aaf45ab636f34016538fe19  smartmontools-6.3.tar.gz
+# From http://sourceforge.net/projects/smartmontools/files/smartmontools/6.4/
+md5	56812c8312fd123ed40ef65afde1049e	smartmontools-6.4.tar.gz
+sha1	855c7d555dd405e5b392b1631dc36dd9632db8b8	smartmontools-6.4.tar.gz
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 7c97a21..6d0a82b 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 6.3
+SMARTMONTOOLS_VERSION = 6.4
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPLv2+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
-- 
2.4.9
