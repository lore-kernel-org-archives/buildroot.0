From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Dec 2019 12:00:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/jailhouse: bump to version 0.11
Message-ID: <20191208110032.1623910-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jailhouse/jailhouse.hash | 3 ++-
 package/jailhouse/jailhouse.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jailhouse/jailhouse.hash b/package/jailhouse/jailhouse.hash
index 6deb184d58..9fb4d599da 100644
--- a/package/jailhouse/jailhouse.hash
+++ b/package/jailhouse/jailhouse.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 27fb262a3b42ba263f2a5a815127d2a9275f2f81e00e782591babb69d4f0465a  jailhouse-0.10.tar.gz
+sha256 8de2406f455db07794cc750238ce57bc897673ba2b68c56fc9ae2d8079142b33  jailhouse-0.11.tar.gz
+sha256 3aafb31a2436178323663e00511f16d58fc36ea654b1457532e79d017205efd8  COPYING
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index aab232eb92..1aa7851707 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JAILHOUSE_VERSION = 0.10
+JAILHOUSE_VERSION = 0.11
 JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
 JAILHOUSE_LICENSE = GPL-2.0
 JAILHOUSE_LICENSE_FILES = COPYING
-- 
2.24.0
