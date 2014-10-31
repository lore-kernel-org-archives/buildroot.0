From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 31 Oct 2014 18:47:54 -0300
Subject: [Buildroot] [PATCH 1/2] rdesktop: bump to version 1.8.3
Message-ID: <1414792075-31124-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rdesktop/rdesktop.hash | 3 +++
 package/rdesktop/rdesktop.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/rdesktop/rdesktop.hash

diff --git a/package/rdesktop/rdesktop.hash b/package/rdesktop/rdesktop.hash
new file mode 100644
index 0000000..cc1f55b
--- /dev/null
+++ b/package/rdesktop/rdesktop.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/rdesktop/files/rdesktop/1.8.3/
+md5	86e8b368a7c715e74ded92e0d7912dc5	rdesktop-1.8.3.tar.gz
+sha1	aa1e56043782e04a0121357b24874e3ad6ae7b1d	rdesktop-1.8.3.tar.gz
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index ea1e505..79187b5 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDESKTOP_VERSION = 1.8.2
+RDESKTOP_VERSION = 1.8.3
 RDESKTOP_SITE = http://downloads.sourceforge.net/project/rdesktop/rdesktop/$(RDESKTOP_VERSION)
 RDESKTOP_DEPENDENCIES = host-pkgconf openssl xlib_libX11 xlib_libXt \
 	$(if $(BR2_PACKAGE_ALSA_LIB_PCM),alsa-lib) \
-- 
2.0.4
