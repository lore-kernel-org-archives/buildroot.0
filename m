From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 Sep 2016 11:26:18 -0300
Subject: [Buildroot] [PATCH] samba4: bump to version 4.4.6
Message-ID: <1474727178-16722-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 5d2ac09..e48d5c8 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	b876ef2e63f66265490e80a122e66ef2d7616112b839df68f56ac2e1ce17a7bd	samba-4.4.5.tar.gz
+sha256	37c423dd590c63099d952b06c07bf399da7cc6c2e72739b831eedd7dbe8cc18c	samba-4.4.6.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index facaca6..6d84f53 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.4.5
+SAMBA4_VERSION = 4.4.6
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.7.3
