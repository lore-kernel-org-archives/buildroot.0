From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 23 Nov 2018 17:24:48 +0100
Subject: [Buildroot] [PATCH/next 1/1] linuxptp: bump to version 2.0
Message-ID: <20181123162448.26875-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linuxptp/linuxptp.hash | 8 ++++----
 package/linuxptp/linuxptp.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index 9e738323d2..5e6c7741cd 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,9 +1,9 @@
-# From https://sourceforge.net/projects/linuxptp/files/v1.9/
-sha1 6eb9dddfa54ce3154a6f2035a1b18fe66459b50f  linuxptp-1.9.2.tgz
-md5 7c6672c59b888fa92ffd31398221b243  linuxptp-1.9.2.tgz
+# From https://sourceforge.net/projects/linuxptp/files/v2.0/
+sha1 592ca42c6146a79c1fcabed7c19fa7af4803d4f6  linuxptp-2.0.tgz
+md5 d8bb7374943bb747db7786ac26f17f11  linuxptp-2.0.tgz
 
 # Locally computed:
-sha256 7f662e65c66c37ff211dc525476626875c2b74162ded05c8a25d036fb963b8d0  linuxptp-1.9.2.tgz
+sha256 0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d  linuxptp-2.0.tgz
 
 # Hash for license file:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 7086c47093..c304ff6d6e 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 1.9.2
+LINUXPTP_VERSION = 2.0
 LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
-- 
2.14.1
