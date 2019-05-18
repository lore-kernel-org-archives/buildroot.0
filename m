From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 May 2019 00:02:36 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/powertop: bump to version 2.10
Message-ID: <20190518220236.5858-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/powertop/powertop.hash | 3 ++-
 package/powertop/powertop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/powertop/powertop.hash b/package/powertop/powertop.hash
index 0f9acdc277..13e938d505 100644
--- a/package/powertop/powertop.hash
+++ b/package/powertop/powertop.hash
@@ -1,2 +1,3 @@
 # Locally-generated hash
-sha256	aa7fb7d8e9a00f05e7d8a7a2866d85929741e0d03a5bf40cab22d2021c959250	powertop-v2.9.tar.gz
+sha256	d3b7459eaba7d01c8841dd33a3b4d369416c01e9bd8951b0d88234cf18fe4a75	powertop-v2.10.tar.gz
+sha256	b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259	COPYING
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index cf5e8d4ffb..e4472080e8 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POWERTOP_VERSION = 2.9
-POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop
+POWERTOP_VERSION = 2.10
+POWERTOP_SITE = https://01.org/sites/default/files/downloads
 POWERTOP_SOURCE = powertop-v$(POWERTOP_VERSION).tar.gz
 POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES)
-- 
2.20.1
