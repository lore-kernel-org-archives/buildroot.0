From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Sep 2016 21:30:55 +0200
Subject: [Buildroot] [git commit] webkitgtk: bump to version 2.12.5
Message-ID: <20160906193115.D6E668222A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bc1cc7cc182c61a430083b9132c6638caaf5632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index f74677e..f01c7f0 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,4 +1,4 @@
-# From http://www.webkitgtk.org/releases/webkitgtk-2.12.4.tar.xz.sha1
-sha1	ebfe6015d81129b6a13a9596d065c54e9c1b93f6	webkitgtk-2.12.4.tar.xz
+# From http://www.webkitgtk.org/releases/webkitgtk-2.12.5.tar.xz.sha1
+sha1	2d73fd5b47c68c73aea8b3d7b88acc8e62bdb99c	webkitgtk-2.12.5.tar.xz
 # Calculated based on the hash above
-sha256	424d3177599abbc1eb1a1ad7928dd280a62006e992f2fada2e059375a9609a77	webkitgtk-2.12.4.tar.xz
+sha256	6b147854b864a5f115fadb97b2b6200b2f696db015216a34e7298d11c88b1c40	webkitgtk-2.12.5.tar.xz
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index f5c4334..7843373 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.12.4
+WEBKITGTK_VERSION = 2.12.5
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
