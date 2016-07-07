From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  7 Jul 2016 23:14:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump to 4.4.5
Message-ID: <1467926041-23296-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2016-2119
https://www.samba.org/samba/security/CVE-2016-2119.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index c2cac22..5d2ac09 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	262f9edabbd1c0112819b5063718588c22b0ee4c1a2f648f79f233fdfba25c8b	samba-4.4.4.tar.gz
+# Locally calculated
+sha256	b876ef2e63f66265490e80a122e66ef2d7616112b839df68f56ac2e1ce17a7bd	samba-4.4.5.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9ac72f5..facaca6 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.4.4
+SAMBA4_VERSION = 4.4.5
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.8.1
