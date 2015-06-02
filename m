From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Jun 2015 09:41:05 -0300
Subject: [Buildroot] [PATCH 1/2] samba: bump to version 4.2.2
Message-ID: <1433248866-20991-1-git-send-email-gustavo@zacarias.com.ar>
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
index 42bfb93..11c15b7 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	37eaa239c116dc2c22c29c5a2931eb178ed22e48b594687247446703119b4ac3	samba-4.2.1.tar.gz
+sha256	27d6c69dc3afee38fd28051001d2d4bdae38c567612a9ec6477bb5567e2abc1e	samba-4.2.2.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e5971fb..d7d5299 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.2.1
+SAMBA4_VERSION = 4.2.2
 SAMBA4_SITE = http://ftp.samba.org/pub/samba
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.3.6
