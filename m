From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Oct 2014 16:33:20 -0300
Subject: [Buildroot] [PATCH] liboping: bump to version 1.7.0
Message-ID: <1412624000-8938-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liboping/liboping.hash | 2 ++
 package/liboping/liboping.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/liboping/liboping.hash

diff --git a/package/liboping/liboping.hash b/package/liboping/liboping.hash
new file mode 100644
index 0000000..5987d7a
--- /dev/null
+++ b/package/liboping/liboping.hash
@@ -0,0 +1,2 @@
+# From http://verplant.org/liboping/#download
+sha256	25cf9417fe84d70c4b1bd97f1f92e597ccdc1ec2da3b7eb311f33f5e7033a70e	liboping-1.7.0.tar.gz
diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index 22fa4fb..bb02616 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPING_VERSION = 1.6.2
+LIBOPING_VERSION = 1.7.0
 LIBOPING_SITE = http://verplant.org/liboping/files
 LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
-- 
2.0.4
