From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Aug 2017 07:26:42 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/samba4: bump version to 4.6.7
Message-ID: <20170818052642.32104-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.6.7.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index a2a0cd3a3..24e9ae178 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 fc31c809f7d85ae30f2b7dcddcb8404201b626047458cb5f2b743d4f6f3f1a8e  samba-4.6.6.tar.gz
+sha256 9ef24393de08390f236cabccd6a420b5cea304e959cbf1a99ff317325db3ddfa  samba-4.6.7.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 67b00b996..fddd94822 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.6.6
+SAMBA4_VERSION = 4.6.7
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.11.0
