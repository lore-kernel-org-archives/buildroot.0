From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 22 Apr 2021 21:06:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.14.3
Message-ID: <20210422190646.407136-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.14.3.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 4d808c5fe3..e8814348c5 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.14.2.tar.asc
-sha256  95651da478743f7cb407aec81287536c096e3e18bb4981dbe47ca70bf6181f96  samba-4.14.2.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.14.3.tar.asc
+sha256  efc24ccf277055891f830719bd155b6a6dd9341d71961ee79e0ef75dc1aeb598  samba-4.14.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ce41208981..643b228bbf 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.14.2
+SAMBA4_VERSION = 4.14.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.29.2
