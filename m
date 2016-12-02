From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2016 00:00:18 +0100
Subject: [Buildroot] [git commit] acpica: bump to version 20161117
Message-ID: <20161202230047.2D0BD81E4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c21c005d53c4697e64a7284fa34b061ac198178b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build- and run-tested on x86_64 and aarch64.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
