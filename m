From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Jul 2018 20:17:12 +0200
Subject: [Buildroot] [PATCH 1/2] mutt: bump to version 1.10.1
Message-ID: <20180723181713.18954-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index cab8d2db68..27eeb56804 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bf617e64ae4e08a998bef8e42a965a211587e051f1437a3a4884b351a9385753  mutt-1.9.5.tar.gz
+sha256 734a3883158ec3d180cf6538d8bd7f685ce641d2cdef657aa0038f76e79a54a0  mutt-1.10.1.tar.gz
 sha256 732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index d224138c57..1a2c5342d7 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.9.5
+MUTT_VERSION = 1.10.1
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.14.1
