From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 12 Jan 2016 08:55:37 -0300
Subject: [Buildroot] [PATCH] samba4: bump to version 4.3.4
Message-ID: <1452599737-10684-1-git-send-email-gustavo@zacarias.com.ar>
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
index 494ad17..f42e37a 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e62d21313acbb29e24b0b80aaf2b63fdd1ccce4cfb741f333deca95a1a3a70df	samba-4.3.3.tar.gz
+sha256	5d0eb52e842832af922f7d57716eacff23192906ec3bdf6727e18ca24f1419d9	samba-4.3.4.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 50a2692..4e796a6 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.3.3
+SAMBA4_VERSION = 4.3.4
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.4.10
