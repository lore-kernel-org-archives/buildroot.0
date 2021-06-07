From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:38 -0000
Subject: [Buildroot] [git commit] package/webkitgtk: bump to version 2.32.1
Message-ID: <20210607144655.1B761814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=deac34e1d3e40fb1533ca1b674b39f09358af69b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to a new major release which bring in improvements and a few new
features. Release notes:

  https://webkitgtk.org/2021/03/26/webkitgtk2.32.0-released.html
  https://webkitgtk.org/2021/05/10/webkitgtk2.32.1-released.html

None of the new features in WebKitGTK 2.32.x need additional
dependencies.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index d85a7f46f2..d8bfa60fb8 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.30.6.tar.xz.sums
-md5  11148c4ed400c58fe330ac94208cbc4d  webkitgtk-2.30.6.tar.xz
-sha1  aaaf9b0f1780f3eae104ae0d3ad15b3e19cf6e8d  webkitgtk-2.30.6.tar.xz
-sha256  50736ec7a91770b5939d715196e5fe7209b93efcdeef425b24dc51fb8e9d7c1e  webkitgtk-2.30.6.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.32.1.tar.xz.sums
+md5  b12790ae1209e1d5848aeb4fb70994db  webkitgtk-2.32.1.tar.xz
+sha1  c8c507d3c98c891ea5bfcfb6407320959dc77a2b  webkitgtk-2.32.1.tar.xz
+sha256  136117317f70f66486f71b8edf5e46f8776403c5d8a296e914b11a36ef836917  webkitgtk-2.32.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 1720ffc7d6..42132ca5fc 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.30.6
+WEBKITGTK_VERSION = 2.32.1
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
