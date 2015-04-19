From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 17:42:27 +0200
Subject: [Buildroot] [PATCH 1/5] package/libdvbsi: bump version to 0.3.7,
	add hash
Message-ID: <1429458151-20049-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdvbsi/libdvbsi.hash |    2 ++
 package/libdvbsi/libdvbsi.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/libdvbsi/libdvbsi.hash

diff --git a/package/libdvbsi/libdvbsi.hash b/package/libdvbsi/libdvbsi.hash
new file mode 100644
index 0000000..7454625
--- /dev/null
+++ b/package/libdvbsi/libdvbsi.hash
@@ -0,0 +1,2 @@
+# From http://www.saftware.de/libdvbsi++/libdvbsi++-0.3.7.tar.bz2.md5
+md5	7eb50352c06b17c499a6d51e18e99ec5	libdvbsi++-0.3.7.tar.bz2
diff --git a/package/libdvbsi/libdvbsi.mk b/package/libdvbsi/libdvbsi.mk
index c67bdbd..ed8b382 100644
--- a/package/libdvbsi/libdvbsi.mk
+++ b/package/libdvbsi/libdvbsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVBSI_VERSION = 0.3.6
+LIBDVBSI_VERSION = 0.3.7
 LIBDVBSI_SOURCE = libdvbsi++-$(LIBDVBSI_VERSION).tar.bz2
 LIBDVBSI_SITE = http://www.saftware.de/libdvbsi++
 LIBDVBSI_INSTALL_STAGING = YES
-- 
1.7.10.4
