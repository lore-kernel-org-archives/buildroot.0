From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Jul 2015 19:52:59 -0300
Subject: [Buildroot] [PATCH] vsftpd: bump to version 3.0.3
Message-ID: <1438037579-19439-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vsftpd/vsftpd.hash | 2 +-
 package/vsftpd/vsftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vsftpd/vsftpd.hash b/package/vsftpd/vsftpd.hash
index 6b46e4b..a0cd55b 100644
--- a/package/vsftpd/vsftpd.hash
+++ b/package/vsftpd/vsftpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	be46f0e2c5528fe021fafc8dab1ecfea0c1f183063a06977f8537fcd0b195e56	vsftpd-3.0.2.tar.gz
+sha256	9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7	vsftpd-3.0.3.tar.gz
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index e5b505d..1e48264 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VSFTPD_VERSION = 3.0.2
+VSFTPD_VERSION = 3.0.3
 VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
 VSFTPD_LICENSE = GPLv2
-- 
2.3.6
