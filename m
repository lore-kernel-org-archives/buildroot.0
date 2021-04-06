From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 17:57:46 +0000
Subject: [Buildroot] [PATCH 6/9] package/s6-linux-init: bump to version
 1.0.6.1
Message-ID: <K7CxLpfdH39cbMV57fClaBXaHsn0J9e3uO5ZiIGtjw@cp3-web-016.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1535:lpehbljhhcpaopbnkkbf

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/s6-linux-init/s6-linux-init.hash | 2 +-
 package/s6-linux-init/s6-linux-init.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index bc2f7072ca..c35862efef 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 216af5589c2bc5dbdea6b6c94d55575c12e31f57b2e0fde5c534a840aeed02fb  s6-linux-init-1.0.3.1.tar.gz
+sha256 16f6c84f3c4825ca8b244b89693569d8f69db98c485bd958301a079586f2086b  s6-linux-init-1.0.6.1.tar.gz
 sha256 487e89990a571700bcdf7c0cbbde2859446f79e85e8b59791adab98fff6b1889  COPYING
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index 71c727de02..efd4984085 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 1.0.3.1
+S6_LINUX_INIT_VERSION = 1.0.6.1
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
-- 
2.30.2
