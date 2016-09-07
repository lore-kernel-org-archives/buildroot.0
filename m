From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed,  7 Sep 2016 22:42:37 +0200
Subject: [Buildroot] [PATCH 1/1] acpica: bump version to 20160831
Message-ID: <20160907204237.8263-1-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New version has been build- and run-tested on x86_64 and aarch64.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/acpica/acpica.hash | 2 +-
 package/acpica/acpica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 8d5257f..ca6dd92 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 4ac73a5887b643dcca483f0241cbb808a53326846928edad9a2f86cffcde5850 acpica-unix2-20160527.tar.gz
+sha256 fea808449aac29442c22419ad9e3eaa6b1a35f02e0db2b2f8802dc3af69e4965 acpica-unix2-20160831.tar.gz
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index b8459d8..a42eb72 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20160527
+ACPICA_VERSION = 20160831
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
 ACPICA_LICENSE = BSD-3c or GPLv2
-- 
2.9.3
