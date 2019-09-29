From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 29 Sep 2019 11:42:46 +0200
Subject: [Buildroot] [PATCH] package/libsoundtouch: bump to version 2.1.2
Message-ID: <1569750166-6261-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Updated download site and download method
- Added hash for license file

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libsoundtouch/libsoundtouch.hash | 5 ++++-
 package/libsoundtouch/libsoundtouch.mk   | 5 ++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index af0c362..4e9d3dc 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,2 +1,5 @@
 # Locally computed
-sha256 c805e7a72b7758a8986b71e73d2f94a8c79c66c1246fa2af1743c4282702e096  libsoundtouch-010a91a59071c7fefd316fca62c0d980ec85b4b1.tar.gz
+sha256 3a431facf019f37cc2da112156226d686e941b15d6327f3a41d7ca21dfaf8e94  libsoundtouch-2.1.2.tar.gz
+
+# Hash for license file
+sha256 6b73f6327136a924821ec044bbd9f17cf8677faf2f2a2b1366a9fff6188c9688  COPYING.TXT
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index c4ac930..d6ac129 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBSOUNDTOUCH_VERSION = 010a91a59071c7fefd316fca62c0d980ec85b4b1
-LIBSOUNDTOUCH_SITE = https://freeswitch.org/stash/scm/sd/libsoundtouch.git
-LIBSOUNDTOUCH_SITE_METHOD = git
+LIBSOUNDTOUCH_VERSION = 2.1.2
+LIBSOUNDTOUCH_SITE = https://gitlab.com/soundtouch/soundtouch/-/archive/$(LIBSOUNDTOUCH_VERSION)
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
 LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
 LIBSOUNDTOUCH_AUTORECONF = YES
-- 
2.7.4
