From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 16 Oct 2015 01:13:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/intltool: bump to version 0.51.0
Message-ID: <1444950823-5199-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a stronger, locally calculated sha256 checksum.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/intltool/intltool.hash | 7 +++++--
 package/intltool/intltool.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/intltool/intltool.hash b/package/intltool/intltool.hash
index a60af50..f6f41dc 100644
--- a/package/intltool/intltool.hash
+++ b/package/intltool/intltool.hash
@@ -1,2 +1,5 @@
-# From https://launchpad.net/intltool/trunk/0.50.2/+download/intltool-0.50.2.tar.gz/+md5
-md5	23fbd879118253cb99aeac067da5f591	intltool-0.50.2.tar.gz
+# From https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz/+md5
+md5	12e517cac2b57a0121cda351570f1e63 intltool-0.51.0.tar.gz
+
+# Locally calculated
+sha256 67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd  intltool-0.51.0.tar.gz
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 549cb3b..fb801a1 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTLTOOL_VERSION = 0.50.2
+INTLTOOL_VERSION = 0.51.0
 INTLTOOL_SITE = https://launchpad.net/intltool/trunk/$(INTLTOOL_VERSION)/+download
 INTLTOOL_LICENSE = GPLv2+
 INTLTOOL_LICENSE_FILES = COPYING
-- 
2.6.1
