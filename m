From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 21:34:30 +0200
Subject: [Buildroot] [PATCH 1/1] mutt: bump to version 1.9.5
Message-ID: <20180501193430.24260-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 3 ++-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index f6dc472d48..cab8d2db68 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 9b81746d67ffeca5ea44f60893b70dc93c86d4bc10187d4dd360185e4d42ed42  mutt-1.8.3.tar.gz
+sha256 bf617e64ae4e08a998bef8e42a965a211587e051f1437a3a4884b351a9385753  mutt-1.9.5.tar.gz
+sha256 732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index b0bf5a7b41..d224138c57 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.8.3
+MUTT_VERSION = 1.9.5
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.14.1
