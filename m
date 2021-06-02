From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Jun 2021 17:38:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.14.5
Message-ID: <20210602153848.396406-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes of this bugfix release:
https://www.samba.org/samba/history/samba-4.14.5.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 905ec14ce0..9b90718682 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.14.4.tar.asc
-sha256  89af092a0b00f5354ed287f0aa37b8c2cf9ba2ce67ea6464192e2c18528f89b9  samba-4.14.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.14.5.tar.asc
+sha256  bb6ef5d2f16b85288d823578abc453d9a80514c42e5a2ea2c4e3c60dc42335c3  samba-4.14.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 409e2c7a18..69f4ad26e5 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.14.4
+SAMBA4_VERSION = 4.14.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.29.2
