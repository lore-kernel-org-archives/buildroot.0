From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri,  2 Dec 2016 23:40:16 +0100
Subject: [Buildroot] [PATCH 1/1] acpica: bump to version 20161117
Message-ID: <1480718417-21000-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build- and run-tested on x86_64 and aarch64.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/acpica/acpica.hash | 3 ++-
 package/acpica/acpica.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index ca6dd92..8f1c08a 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 fea808449aac29442c22419ad9e3eaa6b1a35f02e0db2b2f8802dc3af69e4965 acpica-unix2-20160831.tar.gz
+sha256 dfb33db5599bd48134dbd6e50c8804099be0cf1c35d98975a6cb84dabca78b67 acpica-unix2-20161117.tar.gz
+
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index a42eb72..f76c948 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20160831
+ACPICA_VERSION = 20161117
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
 ACPICA_LICENSE = BSD-3c or GPLv2
-- 
2.7.4
