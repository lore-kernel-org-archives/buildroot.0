From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 29 Apr 2021 22:19:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.14.4
Message-ID: <20210429201952.1090896-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2021-20254:
https://www.samba.org/samba/security/CVE-2021-20254.html

Release notes: https://www.samba.org/samba/history/samba-4.14.4.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index e8814348c5..905ec14ce0 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.14.3.tar.asc
-sha256  efc24ccf277055891f830719bd155b6a6dd9341d71961ee79e0ef75dc1aeb598  samba-4.14.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.14.4.tar.asc
+sha256  89af092a0b00f5354ed287f0aa37b8c2cf9ba2ce67ea6464192e2c18528f89b9  samba-4.14.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 643b228bbf..409e2c7a18 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.14.3
+SAMBA4_VERSION = 4.14.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.29.2
