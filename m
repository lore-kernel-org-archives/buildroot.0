From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 15 Aug 2018 07:23:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump to version
 4.8.4
Message-ID: <20180815052300.11971-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.8.4.html

Fixes

o  CVE-2018-1139  (Weak authentication protocol allowed.)
o  CVE-2018-1140  (Denial of Service Attack on DNS and LDAP server.)
o  CVE-2018-10858 (Insufficient input validation on client directory
                   listing in libsmbclient.)
o  CVE-2018-10918 (Denial of Service Attack on AD DC DRSUAPI server.)
o  CVE-2018-10919 (Confidential attribute disclosure from the AD LDAP
                   server.)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 4b1b1218ac..00c8466078 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.8.3.tar.asc
-sha256 e0569a8a605d5dfb49f1fdd11db796f4d36fe0351c4a7f21387ef253010b82ed  samba-4.8.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.8.4.tar.asc
+sha256 f5044d149e01894a08b1d114b8b69aed78171a7bb19608bd1fd771453b9a5406  samba-4.8.4.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 52d59ffeb9..03ef6eeeb0 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.8.3
+SAMBA4_VERSION = 4.8.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.18.0
