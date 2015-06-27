From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Jun 2015 08:23:02 -0300
Subject: [Buildroot] [PATCH] pure-ftpd: bump to version 1.0.41
Message-ID: <1435404182-17439-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pure-ftpd/pure-ftpd.hash | 2 ++
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/pure-ftpd/pure-ftpd.hash

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
new file mode 100644
index 0000000..d0d35ac
--- /dev/null
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	b72456def52c71baf8d0367ca6b7aba10796e2883a76eeb41f58f2f06f7087ba	pure-ftpd-1.0.41.tar.gz
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 5dbcaae..3c59bb1 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.36
+PURE_FTPD_VERSION = 1.0.41
 PURE_FTPD_SITE = http://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_LICENSE = ISC
 PURE_FTPD_LICENSE_FILES = COPYING
-- 
2.3.6
