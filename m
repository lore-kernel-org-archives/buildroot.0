From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:04:33 +0200
Subject: [Buildroot] [git commit] pure-ftpd: bump to version 1.0.41
Message-ID: <20150628120452.905E780DAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee6c9f5a1bc1995d968214345c011a44a3c145c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pure-ftpd/pure-ftpd.hash |    2 ++
 package/pure-ftpd/pure-ftpd.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
