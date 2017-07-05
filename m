From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed,  5 Jul 2017 17:33:03 +0300
Subject: [Buildroot] [PATCH 1/1] webkitgtk: bump to version 2.16.5
Message-ID: <20170705143303.26282-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This simply updates to the latest stable release. WebKitGTK+ versions
in the 2.1x series avoid bumping the dependencies in order to allow
distributions to provide updates, therefore no new dependencies are
needed.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index f01c7f0c07..5df4ce8df3 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,4 +1,4 @@
-# From http://www.webkitgtk.org/releases/webkitgtk-2.12.5.tar.xz.sha1
-sha1	2d73fd5b47c68c73aea8b3d7b88acc8e62bdb99c	webkitgtk-2.12.5.tar.xz
-# Calculated based on the hash above
-sha256	6b147854b864a5f115fadb97b2b6200b2f696db015216a34e7298d11c88b1c40	webkitgtk-2.12.5.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.16.5.tar.xz.sums
+md5 fce72dc89cd310a663d9eb97133861fe webkitgtk-2.16.5.tar.xz
+sha1 8052fda41b1b666f175baaac787c5cba39ed24a0 webkitgtk-2.16.5.tar.xz
+sha256 8e0396f3428e757898c5856e642eed4fcd5a20ae03d96d3eaa03b76634be7dd4 webkitgtk-2.16.5.tar.xz
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index f37aaa6e0c..cc8d960e47 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.12.5
+WEBKITGTK_VERSION = 2.16.5
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.13.2
